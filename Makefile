#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

export TOPDIR	:= $(CURDIR)
export TOOLS 	:= $(CURDIR)/tools
export LIB 		:= $(CURDIR)/lib
export SYRIINGE	:= $(CURDIR)/Syriinge
export LLVMDIR	:= $(TOOLS)/llvm
export MWCCDIR	:= $(TOOLS)/mwcc/Wii/1.0

.PHONY: all clean

all: Brawlback-Online.rel sy_core.rel

Brawlback-Online.rel:
	$(MAKE) -C Brawlback-Online CC=$(LLVMDIR)/bin/clang CXX=$(LLVMDIR)/bin/clang ELF2REL=$(TOOLS)/elf2rel LD=$(LLVMDIR)/bin/ld.lld
	@cp $(CURDIR)/Brawlback-Online/Brawlback-Online.rel $@

sy_core.rel:
	$(MAKE) -C Syriinge CC=$(LLVMDIR)/bin/clang CXX=$(LLVMDIR)/bin/clang ELF2REL=$(TOOLS)/elf2rel LD=$(LLVMDIR)/bin/ld.lld
	@cp $(CURDIR)/Syriinge/sy_core.rel $@

clean:
	@rm -f ./*.rel
	$(MAKE) -s -C Brawlback-Online clean
	$(MAKE) -s -C Syriinge clean
