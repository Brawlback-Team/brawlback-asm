#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>/devkitpro")
endif

export TOOLS 	:= $(CURDIR)/tools
export LIB 		:= $(CURDIR)/lib


.PHONY: all clean

all: Brawlback-Online.rel ConsoleMirroring-Server.rel ConsoleMirroring-Client.rel

Brawlback-Online.rel:
	$(MAKE) -C Brawlback-Online
	@cp Brawlback-Online/$@ $@

ConsoleMirroring-Server.rel:
	$(MAKE) -C ConsoleMirroring-Server
	@cp ConsoleMirroring-Server/$@ $@

ConsoleMirroring-Client.rel:
	$(MAKE) -C ConsoleMirroring-Client
	@cp ConsoleMirroring-Client/$@ $@

clean:
	@rm ./*.rel
	$(MAKE) -s -C Brawlback-Online clean
	$(MAKE) -s -C ConsoleMirroring-Server clean
	$(MAKE) -s -C ConsoleMirroring-Client clean