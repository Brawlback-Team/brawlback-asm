#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>/devkitpro")
endif

export LLVMPREFIX ?= $(CURDIR)/tools/llvm
export TOOLS 	:= $(CURDIR)/tools
export LIB 		:= $(CURDIR)/lib

.PHONY: all clean

all: Brawlback-Online.rel

Brawlback-Online.rel:
	$(MAKE) -C Brawlback-Online
	@cp Brawlback-Online/$@ $@

clean:
	@rm -f ./*.rel
	$(MAKE) -s -C Brawlback-Online clean
