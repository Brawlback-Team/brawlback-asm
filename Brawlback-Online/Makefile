#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------
ifeq ($(strip $(DEVKITPPC)),)
$(error "Please set DEVKITPPC in your environment. export DEVKITPPC=<path to>devkitPPC")
endif

include $(DEVKITPPC)/wii_rules

#---------------------------------------------------------------------------------
# TARGET is the name of the output
# BUILD is the directory where object files & intermediate files will be placed
# SOURCES is a list of directories containing source code
# INCLUDES is a list of directories containing extra header files
#---------------------------------------------------------------------------------
TARGET		:=	Brawlback-Online
RELID		:=  200
BUILD		:=	build
SOURCES		:=	source $(wildcard source/*) ../lib/BrawlHeaders/PowerPC_EABI_Support/Runtime/Src/
INCLUDES	:=	include

#---------------------------------------------------------------------------------
# options for code generation
#---------------------------------------------------------------------------------
CC 		:= $(LLVMPREFIX)/bin/clang
CXX		:= $(LLVMPREFIX)/bin/clang
LD 		:= $(LLVMPREFIX)/bin/ld.lld

ifeq ($(OS),Windows_NT)
	ELF2REL	:= $(TOOLS)/elf2rel.exe
else
	UNAME_OS := $(shell uname -s | tr A-Z a-z)
	UNAME_ARCH := $(shell uname -m)
	ELF2REL	:= $(TOOLS)/elf2rel.$(UNAME_OS).$(UNAME_ARCH)
endif

CCFLAGS		:= -target powerpc-gekko-ibm-kuribo-eabi -fuse-ld=lld \
			   -nostdlib -nodefaultlibs -fno-addrsig -fno-exceptions \
			   -fno-c++-static-destructors -fno-use-cxa-atexit \
			   -r -flto -ffast-math -fpermissive -fno-unwind-tables -finline-functions -fdeclspec
CXXFLAGS	:= $(CCFLAGS)
LDFLAGS		:= -T $(TOPDIR)/../test.ld --unresolved-symbols=ignore-all -e _prolog -r

#---------------------------------------------------------------------------------
# no real need to edit anything past this point unless you need to add additional
# rules for different file extensions
#---------------------------------------------------------------------------------
ifneq ($(BUILD),$(notdir $(CURDIR)))
#---------------------------------------------------------------------------------

export TOPDIR	:= $(CURDIR)

export OUTPUT	:=	$(CURDIR)/$(TARGET)

export VPATH	:=	$(foreach dir,$(SOURCES),$(CURDIR)/$(dir)) \
			$(foreach dir,$(DATA),$(CURDIR)/$(dir))

export DEPSDIR	:=	$(CURDIR)/$(BUILD)

#---------------------------------------------------------------------------------
# automatically build a list of object files for our project
#---------------------------------------------------------------------------------
CFILES		:=	$(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.c)))
CPPFILES	:=	$(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.cpp)))
sFILES		:=	$(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.s)))
SFILES		:=	$(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.S)))
BINFILES	:=	$(foreach dir,$(DATA),$(notdir $(wildcard $(dir)/*.*)))

#---------------------------------------------------------------------------------
# use CXX for linking C++ projects, CC for standard C
#---------------------------------------------------------------------------------

export OFILES_BIN	:=	$(addsuffix .o,$(BINFILES))
export OFILES_SOURCES := $(CPPFILES:.cpp=.o) $(CFILES:.c=.o) $(sFILES:.s=.o) $(SFILES:.S=.o)
export OFILES := $(OFILES_BIN) $(OFILES_SOURCES)

export HFILES := $(addsuffix .h,$(subst .,_,$(BINFILES)))

# For REL linking
export LDFILES		:= $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.ld)))
export MAPFILE		:= $(LIB)/BrawlHeaders/RSBE01.lst $(SYRIINGE)/sy_core.lst $(TOPDIR)/EXTRA.lst
export LCF			:= $(TOPDIR)/rel.lcf

#---------------------------------------------------------------------------------
# build a list of include paths
#---------------------------------------------------------------------------------
export INCLUDE	:=	$(foreach dir,$(INCLUDES),-I$(CURDIR)/$(dir)) \
			-I$(CURDIR)/$(BUILD) -iquote \
			-I$(LIB)/PowerPC_EABI_Support/Runtime/Inc \
			-I$(LIB)/BrawlHeaders/Brawl/Include \
			-I$(LIB)/BrawlHeaders/nw4r/include \
			-I$(LIB)/BrawlHeaders/OpenRVL/include/ \
			-I$(LIB)/BrawlHeaders/OpenRVL/include/MetroTRK \
			-I$(LIB)/BrawlHeaders/OpenRVL/include/revolution \
			-I$(LIB)/BrawlHeaders/OpenRVL/include/RVLFaceLib \
			-I$(LIB)/BrawlHeaders/OpenRVL/include/stl \
			-I$(LIB)/BrawlHeaders/std/Include \
			-I$(LIB)/BrawlHeaders/utils/include \
			-I$(SYRIINGE)/include \
			-I$(LIB)/brawlback-common

#---------------------------------------------------------------------------------
# build a list of library paths
#---------------------------------------------------------------------------------

export OUTPUT	:=	$(CURDIR)/$(TARGET)
.PHONY: $(BUILD) clean_target

#---------------------------------------------------------------------------------
$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile


#---------------------------------------------------------------------------------
clean:
	@echo clean ...
	@rm -fr $(BUILD) $(OUTPUT).elf $(OUTPUT).rel $(OUTPUT).map $(OUTPUT)-dolphin.map

#---------------------------------------------------------------------------------
else

DEPENDS	:=	$(OFILES:.o=.d)

#---------------------------------------------------------------------------------
# main targets
#---------------------------------------------------------------------------------
$(OUTPUT).rel: $(OUTPUT).elf $(MAPFILE)
$(OUTPUT).elf: $(LDFILES) $(OFILES)

$(OFILES_SOURCES) : $(HFILES)

# REL linking
%.rel: %.elf
	@echo output ... $(notdir $@)
	$(SILENTCMD)$(ELF2REL) $< -s $(MAPFILE) --rel-id $(RELID)

%.elf:
	@echo linking ... $(notdir $@)
	$(SILENTCMD)$(LD) $^ $(LDFLAGS) -Map $(OUTPUT).map -o $@


#---------------------------------------------------------------------------------
# object files
#---------------------------------------------------------------------------------
%.o: %.cpp
#	$(info $<)
	$(SILENTMSG) $(notdir $<)
	$(SILENTCMD)$(CXX) $(CXXFLAGS) -MMD $< $(INCLUDE) -o $(DEPSDIR)/$*.d
	$(SILENTCMD)$(CXX) $(CXXFLAGS) -c $< $(INCLUDE) -o $@

%.o: %.c
#	$(info $<)
	$(SILENTMSG) $(notdir $<)
	$(SILENTCMD)$(CC) $(CCFLAGS) -MMD $< $(INCLUDE) -o $(DEPSDIR)/$*.d
	$(SILENTCMD)$(CC) $(CCFLAGS) -c $< $(INCLUDE) -o $@

-include $(DEPENDS)

#---------------------------------------------------------------------------------
endif
#---------------------------------------------------------------------------------
