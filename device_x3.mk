$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/letv/x3/overlay

LOCAL_PATH := device/letv/x3

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# AAPT
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_COPY_FILES += \
   $(LOCAL_KERNEL):kernel

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    ro.zygote=zygote64_32 \
    camera.disable_zsl_mode=1 \
    ro.mount.fs=EXT4 \
    persist.service.acm.enable=0 \
    persist.sys.usb.config=mtp

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.mt6795:root/fstab.mt6795 \
    $(LOCAL_PATH)/rootdir/init.mt6595.rc:root/init.mt6595.rc \
    $(LOCAL_PATH)/rootdir/init.mt6795.rc:root/init.mt6795.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.mt6795.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6595.rc:root/ueventd.rc
    $(LOCAL_PATH)/rootdir/ueventd.mt6795.rc:root/ueventd.rc
    $(LOCAL_PATH)/rootdir/ueventd.rc:root/ueventd.rc

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8
