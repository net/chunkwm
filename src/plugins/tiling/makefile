BUILD_FLAGS		= -O0 -g -DCHUNKWM_DEBUG -std=c++11 -Wall -Wno-deprecated -Wno-writable-strings
BUILD_PATH		= ./../../../plugins
SRC				= ./plugin.cpp ./node.cpp ./region.cpp ./vspace.cpp \
				  ./controller.cpp ./config.cpp ./rule.cpp ./mouse.cpp \
				  ./../../common/accessibility/display.mm \
				  ./../../common/accessibility/application.cpp \
				  ./../../common/accessibility/window.cpp \
				  ./../../common/accessibility/element.cpp \
				  ./../../common/accessibility/notify.mm \
				  ./../../common/accessibility/observer.cpp \
				  ./../../common/dispatch/cgeventtap.cpp \
				  ./../../common/border/border.mm \
				  ./../../common/ipc/daemon.cpp \
				  ./../../common/config/tokenize.cpp \
				  ./../../common/config/cvar.cpp \
				  ./../../common/misc/carbon.cpp \
				  ./../../common/misc/workspace.mm
BINS			= $(BUILD_PATH)/tiling.so
LINK			= -shared -fPIC -framework Carbon -framework Cocoa -framework ApplicationServices

all: $(BINS)

install: BUILD_FLAGS=-O2 -std=c++11 -Wall
install: clean $(BINS)

.PHONY: all clean install

$(BUILD_PATH):
	mkdir -p $(BUILD_PATH)

clean:
	rm -f $(BUILD_PATH)/tiling.so

$(BUILD_PATH)/tiling.so: $(SRC) | $(BUILD_PATH)
	clang++ $^ $(BUILD_FLAGS) -o $@ $(LINK)
