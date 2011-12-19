#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic incredible,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us.mk)

PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/root/init.inc.rc:root/init.inc.rc \
    device/htc/inc/prebuilt/root/ueventd.inc.rc:root/ueventd.inc.rc

$(call inherit-product-if-exists, vendor/htc/inc/inc-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.error.receiver.system.apps=com.google.android.feedback \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.google.clientidbase=android-verizon \
	ro.com.google.locationfeatures=1 \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.cdma.home.operator.numeric=310004 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
	ro.config.vc_call_vol_steps=7 \
	ro.cdma.otaspnumschema=SELC,1,80,99 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.url.safetylegal=http://www.htc.com/staticfiles/Support/legal/?model=A855 \
	ro.setupwizard.enable_bypass=1 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.media.enc.jpeg.quality=95,85,70

DEVICE_PACKAGE_OVERLAYS += device/htc/inc/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/keylayout/incrediblec-keypad.kl:system/usr/keylayout/incrediblec-keypad.kl \
    device/htc/inc/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Keymap
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/usr/keychars/incrediblec-keypad.kcm.bin:system/usr/keychars/incrediblec-keypad.kcm.bin

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# APN list
PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/inc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/inc/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/inc/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

PRODUCT_COPY_FILES += \
    device/htc/inc/prebuilt/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/inc/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.inc \
    lights.inc \
    gps.inc \
    libOmxCore \
    libOmxVidEnc \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k \
    gralloc.qsd8k \
    com.android.future.usb.accessory
#    copybit.qsd8k \

#Disable HWAccel for now
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.disable_hw_accel=true

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES += en

# Passion uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/htc/inc/prebuilt/root/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/htc/inc/inc-vendor.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)


PRODUCT_NAME := full_inc
PRODUCT_DEVICE := inc
PRODUCT_MODEL := Full Android on Inc