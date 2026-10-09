PACKAGE_NAME = KuwoAutoPlay
PACKAGE_VERSION = 0.0.1
PACKAGE_ARCH = iphoneos-arm64
PACKAGE_DEPENDS = mobilesubstrate
PACKAGE_DESCRIPTION = 打开酷我音乐纯净版(com.yeelion.kwplayersimple)自动点击播放，适配Relaxin松弛树隐根 iOS17.0
PACKAGE_MAINTAINER = Dev

TWEAK_NAME = KuwoAutoPlay
KuwoAutoPlay_FILES = Sources/KuwoAutoPlay/Tweak.x
KuwoAutoPlay_CFLAGS = -fobjc-arc
KuwoAutoPlay_FRAMEWORKS = UIKit
TARGET = iphone:clang:17.0:17.0
THEOS_PACKAGE_SCHEME = roothide
