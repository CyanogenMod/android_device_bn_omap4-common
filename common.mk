# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMON_FOLDER := device/bn/omap4-common

# set to allow building from omap4-common
BOARD_VENDOR := bn

BOARD_USE_CUSTOM_LIBION := true

# Permissions
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/basic_hardware.xml:/system/etc/permissions/basic_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

PRODUCT_PROPERTY_OVERRIDES += \
    com.ti.omap_enhancement=true \
    hwui.render_dirty_regions=false \
    omap.enhancement=true \
    persist.sys.usb.config=mtp,adb \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.crypto.state=unencrypted \
    ro.hwui.disable_scissor_opt=true \
    ro.opengles.version=131072 \
    ro.radio.noril=yes \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Audio Support
PRODUCT_PACKAGES += \
    Music \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.default \
    libaudioutils \
    tinycap \
    tinymix \
    tinyplay

# DRM
PRODUCT_PACKAGES += \
    libwvm \

# Misc / Testing
PRODUCT_PACKAGES += \
    evtest \
    libcorkscrew \
    libjni_pinyinime \
    sh \
    strace

PRODUCT_PACKAGES += \
    pvrsrvinit \
    libPVRScopeServices.so

$(call inherit-product, vendor/bn/omap4-common/omap4-common-vendor.mk)
