THEOS_DEVICE=192.168.1.7

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = shauntweak

shauntweak_FILES = Tweak.xm
shauntweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = your_bundle_identifier

your_bundle_identifier_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk

SUBPROJECTS += preferencedemopreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
