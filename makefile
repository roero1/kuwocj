ARCHS = arm64 arm64e
TARGET = iphone:clang:17.0:17.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KuwoAutoPlay

KuwoAutoPlay_FILES = Sources/KuwoAutoPlay/Tweak.x
KuwoAutoPlay_FRAMEWORKS = UIKit
KuwoAutoPlay_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
