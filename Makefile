PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
ARCHS = arm64 arm64e

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = kukiomod

kukiomod_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
kukiomod_CFLAGS = -fobjc-arc #-w #-Wno-deprecated -Wno-deprecated-declarations
kukiomod_FILES = Tweak.mm Images.mm Page.mm Menu.mm MenuItem.mm ToggleItem.mm PageItem.mm SliderItem.mm TextfieldItem.mm InvokeItem.mm
kukiomod_FRAMEWORKS = UIKit QuartzCore CoreGraphics
kukiomod_LDFLAGS += -Wl,-sectcreate,__DATA,__yuji_font,YujiBoku-Regular.ttf
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
