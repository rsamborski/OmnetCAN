#
# OMNeT++/OMNEST Makefile for omnetcan
#
# This file was generated with the command:
#  opp_makemake -f --deep -O out
#

# Name of target to be created (-o option)
TARGET = omnetcan$(EXE_SUFFIX)

# User interface (uncomment one) (-u option)
USERIF_LIBS = $(ALL_ENV_LIBS) # that is, $(TKENV_LIBS) $(CMDENV_LIBS)
#USERIF_LIBS = $(CMDENV_LIBS)
#USERIF_LIBS = $(TKENV_LIBS)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I. \
    -Ibuilder \
    -Inetworks \
    -Inode \
    -Iresults \
    -Itemplates \
    -Itemplates/randomtopo

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS =

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = \
    $O/builder/netbuilder.o \
    $O/node/App.o \
    $O/node/ccn.o \
    $O/node/ContentStore.o \
    $O/node/L2Queue.o \
    $O/node/LFUContentStore.o \
    $O/node/LRUContentStore.o \
    $O/node/Routing.o \
    $O/node/Packet_m.o

# Message files
MSGFILES = \
    node/Packet.msg

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppmain$D $(USERIF_LIBS) $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

# we want to recompile everything if COPTS changes,
# so we store COPTS into $COPTS_FILE and have object
# files depend on it (except when "make depend" was called)
COPTS_FILE = $O/.last-copts
ifneq ($(MAKECMDGOALS),depend)
ifneq ("$(COPTS)","$(shell cat $(COPTS_FILE) 2>/dev/null || echo '')")
$(shell $(MKPATH) "$O" && echo "$(COPTS)" >$(COPTS_FILE))
endif
endif

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $(TARGET)

$(TARGET) : $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(CXX) $(LDFLAGS) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(AS_NEEDED_OFF) $(WHOLE_ARCHIVE_ON) $(LIBS) $(WHOLE_ARCHIVE_OFF) $(OMNETPP_LIBS)

.PHONY:

.SUFFIXES: .cc

$O/%.o: %.cc $(COPTS_FILE)
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	-rm -rf $O
	-rm -f omnetcan omnetcan.exe libomnetcan.so libomnetcan.a libomnetcan.dll libomnetcan.dylib
	-rm -f ./*_m.cc ./*_m.h
	-rm -f builder/*_m.cc builder/*_m.h
	-rm -f networks/*_m.cc networks/*_m.h
	-rm -f node/*_m.cc node/*_m.h
	-rm -f results/*_m.cc results/*_m.h
	-rm -f templates/*_m.cc templates/*_m.h
	-rm -f templates/randomtopo/*_m.cc templates/randomtopo/*_m.h

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc builder/*.cc networks/*.cc node/*.cc results/*.cc templates/*.cc templates/randomtopo/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/builder/netbuilder.o: builder/netbuilder.cc
$O/node/App.o: node/App.cc \
	node/Packet_m.h \
	node/ccn.h
$O/node/ContentStore.o: node/ContentStore.cc \
	node/ContentStore.h \
	node/Packet_m.h \
	node/ccn.h
$O/node/L2Queue.o: node/L2Queue.cc
$O/node/LFUContentStore.o: node/LFUContentStore.cc \
	node/ContentStore.h \
	node/LFUContentStore.h \
	node/Packet_m.h \
	node/ccn.h
$O/node/LRUContentStore.o: node/LRUContentStore.cc \
	node/ContentStore.h \
	node/LRUContentStore.h \
	node/Packet_m.h \
	node/ccn.h
$O/node/Packet_m.o: node/Packet_m.cc \
	node/Packet_m.h \
	node/ccn.h
$O/node/Routing.o: node/Routing.cc \
	node/Packet_m.h \
	node/ccn.h
$O/node/ccn.o: node/ccn.cc \
	node/ccn.h

