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
windows: Brawlback-Online-windows
linux: Brawlback-Online-linux

Brawlback-Online-linux:
	$(MAKE) -C Brawlback-Online CC=$(TOOLS)/Clang/Ubuntu/clang CXX=$(TOOLS)/Clang/Ubuntu/clang ELF2REL=$(TOOLS)/elf2rel LD=$(TOOLS)/Clang/Ubuntu/ld.lld
	@cp $(CURDIR)/Brawlback-Online/Brawlback-Online.rel $(CURDIR)/Brawlback-Online.rel
Brawlback-Online-windows:
	$(MAKE) -C Brawlback-Online CC=$(TOOLS)/Clang/Windows/clang.exe CXX=$(TOOLS)/Clang/Windows/clang.exe LD=$(TOOLS)/Clang/Windows/ld.lld.exe ELF2REL=$(TOOLS)/elf2rel.exe
	@cp $(CURDIR)/Brawlback-Online/Brawlback-Online.rel $(CURDIR)/Brawlback-Online.rel

clean:
	@rm -f ./*.rel
	$(MAKE) -s -C Brawlback-Online clean
