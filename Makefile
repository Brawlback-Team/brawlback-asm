#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

export TOPDIR	:= $(CURDIR)
export TOOLS 	:= $(CURDIR)/tools
export LIB 		:= $(CURDIR)/lib
export SYRIINGE	:= $(CURDIR)/lib/Syriinge
export LLVMDIR	:= $(TOOLS)/llvm
# export MWCCDIR	:= $(TOOLS)/mwcc/Wii/1.0

ifeq ($(OS),Windows_NT)
	CC := $(LLVMDIR)/bin/clang.exe
	CXX := $(LLVMDIR)/bin/clang.exe
	LD := $(LLVMDIR)/bin/ld.lld.exe
	ELF2REL := $(TOOLS)/elf2rel.exe
else
	CC := $(LLVMDIR)/bin/clang
	CXX := $(LLVMDIR)/bin/clang
	LD := $(LLVMDIR)/bin/ld.lld
	ELF2REL := $(TOOLS)/elf2rel
endif

.PHONY: all clean

all: Brawlback-Online.rel sy_core.rel

Brawlback-Online.rel:
	$(MAKE) -C Brawlback-Online CC=$(CC) CXX=$(CXX) ELF2REL=$(ELF2REL) LD=$(LD)
	@cp $(CURDIR)/Brawlback-Online/Brawlback-Online.rel $@

sy_core.rel:
	$(MAKE) -C $(SYRIINGE) CC=$(CC) CXX=$(CXX) ELF2REL=$(ELF2REL) LD=$(LD)
	@cp $(SYRIINGE)/sy_core.rel $@

clean:
	@rm -f ./*.rel
	$(MAKE) -s -C Brawlback-Online clean
	$(MAKE) -s -C $(SYRIINGE) clean
