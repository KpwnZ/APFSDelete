ARCHS = arm64 arm64e
FINALPACKAGE = 1
include $(THEOS)/makefiles/common.mk

TOOL_NAME = APFSManager

APFSManager_FILES = main.mm
APFSManager_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tool.mk
