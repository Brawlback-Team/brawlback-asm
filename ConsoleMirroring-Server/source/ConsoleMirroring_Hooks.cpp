#include "ConsoleMirroring_Hooks.h"
#include "sy_core.h"
#include <net/net.h>
#include <VI/vi.h>
#include <printf.h>
#include <stdarg.h>
#include "debug.h"
#include <IPC/ipcclt.h>
#include "mem_exp_hooks.h"
#include "utils.h"
#include "TextPrinter.h"
#include <memory.h>
#include "Draw.h"
#include "Drawable.h"

#define BROADCAST_PERIOD 10
#define SERVER_PORT	51442
#define MAX_SERVER_RETRIES 10

u8 wifi_mac_address[6] ALIGNED(32) = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
u32 current_ip_address ALIGNED(32) = 0x00000000;

namespace Broadcast {
    OSThread BrawlbackNetworkBroadcast_Thread;
    char* BroadcastStack;
    const char slip_ready[11] ALIGNED(32) = "BRWL_READY";
    struct broadcast_msg
    {
        unsigned char cmd[11];
    } __attribute__((packed));
    static struct broadcast_msg ready_msg ALIGNED(32);
    static int discover_sock ALIGNED(32);
    static u32 broadcast_ts;
    static struct sockaddr_in discover ALIGNED(32);
    
    static inline u32 TicksToSecs(u32 time)
    {
        return ((time >> 9)*283)>>20;
    }
    static inline u32 TimerDiffSeconds(u32 time)
    {
        u32 curtime = OSGetTick();
        if(time > curtime) return UINT_MAX;
        return TicksToSecs(curtime - time);
    }
    void reset_broadcast_timer() 
    { 
        broadcast_ts = OSGetTick(); 
    }
    
    static void* BrawlbackNetworkBroadcastHandlerThread(void *arg) 
    {
        int status;

        while (1)
        {
            status = Networking::getConnectionStatus();
            if (status != CONN_STATUS_CONNECTED)
                do_broadcast();
            unsigned int retTime = TicksToSecs(OSGetTick()) + 5;   // Get finishing time.
            while (TicksToSecs(OSGetTick()) < retTime){}
        }
    }
    void BrawlbackNetworkBroadcastShutdown() 
    { 
        OSCancelThread(&BrawlbackNetworkBroadcast_Thread); 
    }
    void BrawlbackNetworkBroadcastInit()
    {
        memset(&discover, 0, sizeof(discover));
        discover.sin_family = AF_INET;
        discover.sin_port = SOHtoNs(20583);
        discover.sin_addr.s_addr = SOHtoNl(0xffffffff);
	    startBroadcast();
        BroadcastStack = new (Heaps::Syringe) char[0x400];
        OSCreateThread(&BrawlbackNetworkBroadcast_Thread, BrawlbackNetworkBroadcastHandlerThread, NULL, BroadcastStack + sizeof(BroadcastStack), sizeof(BroadcastStack), 31, 0);
        OSResumeThread(&BrawlbackNetworkBroadcast_Thread);
    }
    s32 startBroadcast()
    {
        s32 res;

        // Prepare broadcast message buffer with console info
        memmove(&ready_msg.cmd, &slip_ready, sizeof(slip_ready));

        discover_sock = socket(AF_INET, SOCK_DGRAM, 0);
        // Start indicating our status to clients on the local network
        res = connect(discover_sock, (const struct sockaddr *)&discover, sizeof(discover));

        // Initialize the broadcast message timer
        broadcast_ts = OSGetTick();

        return res;
    }
    s32 do_broadcast(void)
    {
        s32 res;

        if (TimerDiffSeconds(broadcast_ts) < BROADCAST_PERIOD)
            return 0;

        OSReport("Broadcasting: %s\n", ready_msg.cmd);
        res = sendto(discover_sock, &ready_msg, sizeof(ready_msg), 0, (struct sockaddr *)&discover, sizeof(discover));
        broadcast_ts = OSGetTick();
        return res;
    }
}

namespace Networking {
    static const char kd_name[20] ALIGNED(32) = "/dev/net/kd/request";
    static const char ncd_name[20] ALIGNED(32) = "/dev/net/ncd/manage";
    static const char top_name[16] ALIGNED(32) = "/dev/net/ip/top";
    static u8 keepAliveMsgBuf[4];
    static u8 handshakeMsgBuf[8];

    u32 NetworkStarted;
    static int server_sock ALIGNED(32);
    static struct sockaddr_in server ALIGNED(32);
    struct BrawlbackClient client ALIGNED(32);
    struct BrawlbackClient client_prev ALIGNED(32);

    static HandshakeClientPayload handshakeClientPayload;

    char* NetworkStack;
    u32 BrawlbackServerStarted = 0;
	static bool showIP = false;

    s32 top_fd ALIGNED(32);

    OSThread BrawlbackNetwork_Thread;
    static int server_retries = 0;

    static inline u32 GetTicks()
    {
        return OSGetTick();
    }

    static inline u32 TicksToSecs(u32 time)
    {
        //really accurate, it reports the first second is over about 0.5ms early and
        //with a full 37.7 minutes difference its off by only about 0.7ms
        return ((time >> 9)*283)>>20;
    }

    static inline u32 TicksToMs(u32 time)
    {
        // Tick time from https://wiibrew.org/wiki/Hardware/Starlet_Timer
        return time * 0.0005267;
    }

    static inline u32 TimerDiffTicks(u32 time)
    {
        u32 curtime = OSGetTick();
        if(time > curtime) return UINT_MAX; //wrapped, return UINT_MAX to reset
        return curtime - time;
    }

    static inline u32 TimerDiffSeconds(u32 time)
    {
        u32 curtime = OSGetTick();
        if(time > curtime) return UINT_MAX; //wrapped, return UINT_MAX to reset
        return TicksToSecs(curtime - time);
    }
    static inline u32 TimerDiffMs(u32 time)
    {
        u32 diff = TimerDiffTicks(time);
        return TicksToMs(diff);
    }
    static void* BrawlbackNetworkHandlerThread(void *arg) 
    {
        while (1)
        {
            int status = getConnectionStatus();
            switch (status)
            {
            case CONN_STATUS_NO_SERVER:
                startServer();
                break;
            case CONN_STATUS_NO_CLIENT:
                listenForClient();
                break;
            case CONN_STATUS_CONNECTED:
                checkAlive();
                break;
            }

            unsigned int retTime = TicksToSecs(OSGetTick()) + 5;   // Get finishing time.
            while (TicksToSecs(OSGetTick()) < retTime){}
        }
    }
    void SlippiNetworkShutdown() { OSCancelThread(&BrawlbackNetwork_Thread); }
    int BrawlbackNetworkInit()
    {
        server_sock = -1;
        client.socket = -1;
        memset(&server, 0, sizeof(server));
        server.sin_family = AF_INET;
        server.sin_port = SOHtoNs(SERVER_PORT);
        server.sin_addr.s_addr = SOHtoNl(INADDR_ANY);
        NetworkStack = new (Heaps::Syringe) char[0x2000];
        OSReport("net_thread is starting ...\r\n");
        OSCreateThread(&BrawlbackNetwork_Thread, BrawlbackNetworkHandlerThread, NULL, NetworkStack + sizeof(NetworkStack), sizeof(NetworkStack), 31, 0);
        OSResumeThread(&BrawlbackNetwork_Thread);
        BrawlbackServerStarted = 1;
        return 0;
    }
    bool waitForMessage(s32 socket, u32 timeout_ms)
    {
        // Don't do anything if the socket is invalid
        if (socket < 0) return 0;

        STACK_ALIGN(struct ::pollsd, client_poll, 1, 32);
        client_poll[0].socket = socket;
        client_poll[0].events = 0x0001;
        int res = 0;
        SOPoll(socket, res, client_poll, timeout_ms);
        OSReport("[Client Msg] Result: %d\r\n", res);

        // TODO: How to handle potential errors here?
        if (res < 0) OSReport("WARN: poll() returned %d\r\n", res);

        if (client_poll[0].revents & 0x0001) return true;
        else return false;
    }
    static u8 clientMsg[CLIENT_MSG_BUF_SIZE];
    s32 getClientMessage(s32 socket, u32 waitTimeMs)
    {
        u32 startTime = OSGetTick();
        s32 pos = 0;

        u32 msgSize = 0;

        while (TimerDiffMs(startTime) < waitTimeMs)
        {
            bool hasData = waitForMessage(socket, 100);
            if (!hasData) {
                OSReport("[Client Msg] No data\r\n");
                continue;
            }

            u32 readLen = 0;

            // First we need to read the total message size
            if (msgSize == 0) {
                // Read message size into
                readLen = recv(socket, &msgSize, 4, 0);
                OSReport("[Recv Len] Res: %d | Val: %d\r\n", readLen, msgSize);
                if (readLen != 4) {
                    // If first read does not contain the size, this is probably an error? It might be possible
                    // to get
                    return -2;
                }
            }

            // Message is too long to read. Hang up on the other end
            if(msgSize > CLIENT_MSG_BUF_SIZE) {
                return -2;
            }

            readLen = recv(socket, &clientMsg[pos], msgSize - pos, 0);
            OSReport("[Recv] Res: %d\r\n", readLen);

            pos += readLen;

            if (pos >= msgSize) {
                // If pos is now equal to message size, we have finished reading the message

                // Uncomment this to debug messages from client and also to determine where data
                // is stored in the message
                // int i;
                // for (i = 0; i < msgSize; i++) {
                // 	dbgprintf("[%i] %i | %x\r\n", i, clientMsg[i], clientMsg[i]);
                // }

                return pos;
            }
        }
        return -1;
    }
    static inline int randi(int max) {
        return g_mtRandDefault.seed % max;
    }
    u32 generateToken(u32 except)
    {
        u32 tok = 0;

        while ((tok == 0x00000000) || (tok == except))
            tok = randi(UINT_MAX);
        return tok;
    }
    int getConnectionStatus()
    {
        if (server_sock < 0)
            return CONN_STATUS_NO_SERVER;
        if (client.socket < 0)
            return CONN_STATUS_NO_CLIENT;
        else if (client.socket >= 0)
            return CONN_STATUS_CONNECTED;

        return CONN_STATUS_UNKNOWN;
    }
    void killClient()
    {
        OSReport("WARN: Client disconnected (socket %d, token=%08x)\r\n",
                client.socket, client.token);
        closesocket(client.socket);

        client.socket = -1;
        client.timestamp = 0;
        client.token = 0;

        Broadcast::reset_broadcast_timer();
    }
    int checkAlive()
    {
        int status = getConnectionStatus();

        // Do nothing if we aren't connected to a client
        if (status != CONN_STATUS_CONNECTED)
            return 0;

        // Only check if we haven't detected any communication
        if (TimerDiffMs(client.timestamp) < 500)
            return 0;

        // Send a keep alive message to the client
        BrawlbackCommMsg keepAliveMsg;
        keepAliveMsg.size = 4;
        u32 msgSize = 3;
        memmove(keepAliveMsgBuf, (u8*)&msgSize, 4);
        keepAliveMsg.msg = keepAliveMsgBuf;
        u32 res = send(client.socket, keepAliveMsg.msg, keepAliveMsg.size, 0);

        // Update timestamp on success, otherwise kill the current client
        if (res == keepAliveMsg.size)
            client.timestamp = OSGetTick();
        else if (res <= 0)
            killClient();

        return 0;
    }
    void stopServer() { closesocket(server_sock); server_sock = -1; }
    int startServer()
    {
        int res;

        // If things are broken, stop trying to initialize the server
        if (server_retries >= MAX_SERVER_RETRIES)
        {
            // Maybe shutdown the network thread here?
            if (server_retries == MAX_SERVER_RETRIES) {
                OSReport("WARN: MAX_SERVER_RETRIES exceeded, giving up\r\n");
                server_retries += 1;
            }

            return -1;
        }

        server_sock = socket(AF_INET, SOCK_STREAM, 0);
        if (server_sock < 0)
        {
            OSReport("WARN: server socket returned %d\r\n", server_sock);
            server_retries += 1;
            server_sock = -1;

            unsigned int retTime = TicksToSecs(OSGetTick()) + 1;   // Get finishing time.
            while (TicksToSecs(OSGetTick()) < retTime){}

            return server_sock;
        }

        res = bind(server_sock, (const struct sockaddr*)&server, sizeof(server));
        if (res < 0)
        {
            stopServer();
            server_retries += 1;
            OSReport("WARN: bind() failed with: %d\r\n", res);
            return res;
        }
        res = listen(server_sock, 1);
        if (res < 0)
        {
            stopServer();
            server_retries += 1;
            OSReport("WARN: listen() failed with: %d\r\n", res);
            return res;
        }

        server_retries = 0;
        return server_sock;
    }
    ClientMsg readClientMessage(u8* buf, u32 len)
    {
        // ubjr_context_t* rctx = ubjr_open_memory(buf,buf+len);
        // ubjr_dynamic_t filestruct = ubjr_read_dynamic(rctx);

        // dbgprintf("[Read Client] Type: %d\r\n", filestruct.type);

        // ubjr_cleanup_dynamic(&filestruct);
        // ubjr_close_context(rctx);

        ClientMsg msg = { 0, NULL };

        if (len <= 8) {
            return msg;
        }

        msg.type = buf[8];
        switch (msg.type) {
        case 1:
            HandshakeClientPayload *payload = &handshakeClientPayload;
            memmove(&payload->clientToken, &buf[60], 4);
            
            payload->isRealtime = buf[76] == 0x54; // Check if realtime bool equals "T"

            // TODO: Figure out why dbgprintf crashes Nintendont in this file
            // dbgprintf("[Tok] Val: %d\r\n", payload.clientToken);

            msg.payload = payload;
            break;
        }

        return msg;
    }
    BrawlbackCommMsg genHandshakeMsg(u32 token)
    {
        u32 type = 1;
        memmove(handshakeMsgBuf, &type, 4);
        memmove(handshakeMsgBuf, &token, 4);

        BrawlbackCommMsg message;
        message.size = 8;
        message.msg = handshakeMsgBuf;

        return message;
    }
    bool createClient(s32 socket)
    {
        s32 res;
        int flags = 1;

        OSReport("HSHK: Waiting ...\r\n");

        // Wait for a handshake message from the client
        s32 msgSize = getClientMessage(socket, HANDSHAKE_TIMEOUT_MS);
        if (msgSize < 0)
        {
            OSReport("[Handshake] getClientMessage returned %d\r\n", msgSize);
            OSReport("[Handshake] Timed out waiting for handshake\r\n", msgSize);
            closesocket(socket);
            return false;
        }

        ClientMsg msg = readClientMessage(clientMsg, msgSize);
        if (msg.type != 1)
        {
            OSReport("[Handshake] Received non-handshake message from client, type: %d\r\n", msg.type);
            closesocket(socket);
            return false;
        }

        HandshakeClientPayload* payload = (HandshakeClientPayload*)msg.payload;
        OSReport("[Handshake] Received instance token: %u\r\n", payload->clientToken);

        u32 token = client_prev.token;
        bool shouldGenToken = token != payload->clientToken || payload->clientToken == 0;
        if (shouldGenToken) {
            OSReport("Client has changed, generating new token.\r\n");
            token = generateToken(token);
        }

        client.token = token;
        client.socket = socket;
        client.timestamp = OSGetTick();

        if (payload->isRealtime) {
            // If realtime mode, turn off nagle's algorithm
            OSReport("Realtime mode is on, turning off nagle's algorithm...\r\n");
            SOSetSockOpt(client.socket, 6, 0x2001, (void*)&flags, sizeof(flags));
        }

        OSReport("Sending token: %u\r\n", client.token);

        // Send a handshake response back to the client
        BrawlbackCommMsg handshakeMsg = genHandshakeMsg(client.token);
        res = send(client.socket, handshakeMsg.msg, handshakeMsg.size, 0);
        if (res < 0) {
            OSReport("Failed to send handshake response. %d\r\n", res);
        }

        return true;
    }
    void listenForClient()
    {
        // We already have an active client
        if (client.socket >= 0)
            return;

        // Block here until we accept a new client connection
        u32 len = sizeof(server);
        s32 socket = accept(server_sock, (struct sockaddr*)&server, &len);

        // If the socket isn't valid, accept() returned some error
        if (socket < 0)
        {
            OSReport("WARN: accept returned %d, server restart\r\n", socket);
            stopServer();
            return;
        }

        // Actually create a new client
        OSReport("Detected connection, creating client ...\r\n");
        createClient(socket);
    }
    int MCDInit() 
    {
        current_ip_address = SOGetHostID();
        NetworkStarted = 1;
        showIP = true;
        return 0;
    }

    void PrintIP()
    {
        if(showIP)
        {
            struct in_addr ip;
            ip.s_addr = current_ip_address;
            
            setupDrawPrimitives();
            GXColor color;
            color.r = 255;
            color.g = 0;
            color.b = 0;
            color.a = 255;
            printer.setTextColor(color);
            printer.setup();
            printer.start2D();
            Message * message = &printer.message;

            message->fontScaleY = 0.5;
            message->fontScaleX = 0.5;
            printer.lineHeight = 20 * message->fontScaleY;
            message->xPos = 20;
            message->yPos = 69;
            printer.startBoundingBox();
            printer.printLine(SOInetNtoA(ip));
            printer.saveBoundingBox(0, color, 2);
        }
    }
}

namespace ConsoleMirroringHooks {
    void InstallHooks() 
    {
        Networking::MCDInit();
        SyringeCore::syInlineHook(0x8001792c, (void*)Networking::PrintIP);
        Networking::BrawlbackNetworkInit();
        Broadcast::BrawlbackNetworkBroadcastInit();
    }
}