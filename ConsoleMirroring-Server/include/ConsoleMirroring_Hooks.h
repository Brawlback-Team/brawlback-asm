#pragma once
#include <types.h>
#include <OS/OSInterrupt.h>
#include <OS/OSError.h>
#include <gf/gf_frame.h>
#include <gf/gf_pad_system.h>
#include <ft/ft_manager.h>
#include <gm/gm_global.h>
#include <gm/gm_global_mode_melee.h>
#include <gf/gf_game_application.h>
#include <gf/gf_scene.h>
#include <sc/sc_melee.h>
#include <mt/mt_rand.h>
#include <OS/OSTime.h>
#include <ExiStructures.h>
#include <ft/ft_manager.h>
#include "utils.h"

#define ALIGNED(x) __attribute__((aligned(x)))
#define STACK_ALIGN(type, name, cnt, alignment)				\
	u8 _al__##name[((sizeof(type)*(cnt)) + (alignment) +		\
	(((sizeof(type)*(cnt))%(alignment)) > 0 ? ((alignment) -	\
	((sizeof(type)*(cnt))%(alignment))) : 0))];			\
	type *name = (type*)(((u32)(_al__##name)) + ((alignment) - ((	\
	(u32)(_al__##name))&((alignment)-1))))

#define CONN_STATUS_UNKNOWN 0
#define CONN_STATUS_NO_SERVER 1
#define CONN_STATUS_NO_CLIENT 2
#define CONN_STATUS_CONNECTED 3

#define READ_BUF_SIZE 25000
#define CLIENT_MSG_BUF_SIZE 1024

#define THREAD_CYCLE_TIME_MS 1	// Thread loop interval (ms)
#define HANDSHAKE_TIMEOUT_MS 5000	// Handshake timeout (ms)
#define CHECK_ALIVE_S 2	// Interval for HELO packets (s)

namespace Broadcast {
	void reset_broadcast_timer();
	void BrawlbackNetworkBroadcastShutdown();
	void BrawlbackNetworkBroadcastInit();
	s32 startBroadcast();
	s32 do_broadcast();
}
namespace Networking {
	typedef struct BrawlbackCommMsg {
		u32 size;
		u8* msg;
	} BrawlbackCommMsg;
	typedef struct ClientMsg {
		u8 type;
		void* payload;
	} ClientMsg;
	typedef struct HandshakeClientPayload {
		u32 clientToken;
		bool isRealtime;
	} HandshakeClientPayload;
	union Token {
		u8 bytes[4];
		u32 word;
	};
	struct handshakeReply
	{
		unsigned char cmd[10];
		u32 token;
	};

	struct BrawlbackClient
	{
		s32 socket;
		char pad1[0x1c];

		u32 timestamp;
		char pad2[0x1c];

		u32 token;
		char pad3[0x1c];

		u32 matchID;
		char pad7[0x1c];
	} ALIGNED(32);

	enum clientVersion
	{
		CLIENT_ERROR	= 1,
		CLIENT_FALLBACK,
		CLIENT_LATEST,
	};

	struct BrawlbackPacket
	{
		char header[4];		// "BRWL"
		u32 type;		// See 'enum messageType'
		u32 len;		// Length of the 'data' array member

		// Keep some space around for later.
		// This also lets us pad data to a 32-byte boundary.
		u8 reserved[0x14];

		char data[0];		// Contents of the message
	} ALIGNED(32);

	// Function declarations
	int startServer();
	void listenForClient();
	int checkAlive();
	int BrawlbackNetworkInit();
	void BrawlbackNetworkShutdown();
	void BrawlbackNetworkSetNewFile(const char* path);
	int getConnectionStatus();
    int MCDInit();
	void PrintIP();
}

namespace ConsoleMirroringHooks {
    void InstallHooks();
}