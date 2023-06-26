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

namespace Broadcast {
    OSThread BrawlbackNetworkBroadcast_Thread;
    char* BroadcastStack;
    const char slip_ready[11] ALIGNED(32) = "BRWL_READY";
    int discover_sock ALIGNED(32);
    static struct sockaddr_in discover ALIGNED(32);
    static int discover_retries = 0;
	Vector<unsigned long*> clientIPs;
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
    void stopListen() { closesocket(discover_sock); discover_sock = -1; }

    s32 listenBroadcast()
    {
        int res;

        struct sockaddr_in from;
        memset(&from, 0, sizeof(from));
        u32 len = sizeof(from);

        u8 buffer[11];
        res = recvfrom(discover_sock, buffer, 11, 0, (struct sockaddr*)&from, &len);
        if(res > 0)
        {
            if(strcmp((const char*)buffer, "BRWL_READY") == 0)
            {
                unsigned long* IP = new(Heaps::Network) unsigned long();
                IP = &from.sin_addr.s_addr;
                OSReport("IP Found: %d\r\n", from.sin_addr.s_addr);
                bool doNotPush = false;
                for(int i = 0; i < clientIPs.size(); i++)
                {
                    if(*clientIPs.get(i) == *IP)
                    {
                        doNotPush = true;
                        break;
                    }
                }
                if(!doNotPush)
                {
                    clientIPs.push(IP);
                }
                else
                {
                    delete IP;
                }
            }
        }

        return res;
    }
    void checkAlive()
    {
        if(CanSendOnSocket(discover_sock) && clientIPs.size() > 0)
        {
            for(int i = 0; i < clientIPs.size(); i++)
            {
                sockaddr_in client;
                discover.sin_family = AF_INET;
                discover.sin_port = SOHtoNs(20583);
                discover.sin_addr.s_addr = *clientIPs[i];

                u32 msgSize = 3;
                if(sendto(discover_sock, &msgSize, 4, 0, (const sockaddr*)&client, sizeof(client)) < 0)
                {
                    OSReport("WARN: IP disconnected; dropping the IP from the list of clients\r\n");
                    clientIPs.erase(i);
                }
            }
        }
    }
    s32 startListenBroadcast() 
    {
        int res;

        // If things are broken, stop trying to initialize the server
        if (discover_retries >= MAX_SERVER_RETRIES)
        {
            // Maybe shutdown the network thread here?
            if (discover_retries == MAX_SERVER_RETRIES) {
                OSReport("WARN: MAX_SERVER_RETRIES exceeded, giving up\r\n");
                discover_retries += 1;
            }

            return -1;
        }

        discover_sock = socket(AF_INET, SOCK_DGRAM, 0);
        if (discover_sock < 0)
        {
            OSReport("WARN: server socket returned %d\r\n", discover_sock);
            discover_retries += 1;
            discover_sock = -1;

            unsigned int retTime = TicksToSecs(OSGetTick()) + 1;   // Get finishing time.
            while (TicksToSecs(OSGetTick()) < retTime){}

            return discover_sock;
        }

        res = bind(discover_sock, (const struct sockaddr*)&discover, sizeof(discover));
        if (res < 0)
        {
            stopListen();
            discover_retries += 1;
            OSReport("WARN: bind() failed with: %d\r\n", res);
            return res;
        }
        
        int optval = 1;
        SOSetSockOpt(discover_sock, 0xffff, 0x0004, (void*)&optval, sizeof(optval));

        discover_retries = 0;
        return discover_sock;
    }
    static void* BrawlbackNetworkBroadcastHandlerThread(void *arg) 
    {
        int status;
        startListenBroadcast();
        while (1)
        {
            listenBroadcast();
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
        discover.sin_addr.s_addr = SOHtoNl(0x0);
        discover_sock = -1;
        BroadcastStack = new (Heaps::Syringe) char[0x2000];
        OSCreateThread(&BrawlbackNetworkBroadcast_Thread, BrawlbackNetworkBroadcastHandlerThread, NULL, BroadcastStack + sizeof(BroadcastStack), sizeof(BroadcastStack), 31, 0);
        OSResumeThread(&BrawlbackNetworkBroadcast_Thread);
    }
}

namespace Networking {
    char* NetworkStack;
    OSThread BrawlbackNetwork_Thread;

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
            
            unsigned int retTime = TicksToSecs(OSGetTick()) + 5;   // Get finishing time.
            while (TicksToSecs(OSGetTick()) < retTime){}
        }
    }
    void SlippiNetworkShutdown() { OSCancelThread(&BrawlbackNetwork_Thread); }
    int BrawlbackNetworkInit()
    {
        NetworkStack = new (Heaps::Syringe) char[0x400];
        OSReport("net_thread is starting ...\r\n");
        OSCreateThread(&BrawlbackNetwork_Thread, BrawlbackNetworkHandlerThread, NULL, NetworkStack + sizeof(NetworkStack), sizeof(NetworkStack), 31, 0);
        OSResumeThread(&BrawlbackNetwork_Thread);
        return 0;
    }
}

namespace ConsoleMirroringHooks {
    void InstallHooks() 
    {
        Broadcast::BrawlbackNetworkBroadcastInit();
        Networking::BrawlbackNetworkInit();
    }
}