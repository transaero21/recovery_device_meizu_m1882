#
# Copyright 2017 The Android Open Source Project
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

# Set device codename before including makefiles
PRODUCT_RELEASE_NAME := m1882

# Inherit product configurations
$(call inherit-product, build/target/product/embedded.mk)
$(call inherit-product, device/meizu/m1882/m1882.mk)
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_NAME := omni_m1882
PRODUCT_BRAND := Meizu
PRODUCT_DEVICE := m1882
PRODUCT_MANUFACTURER := Meizu
PRODUCT_MODEL := 16th

TARGET_VENDOR_PRODUCT_NAME := m1882
TARGET_VENDOR_DEVICE_NAME := m1882

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=m1882 \
    BUILD_PRODUCT=m1882 \
    PRODUCT_NAME=m1882

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="16th" \
    PRODUCT_NAME="meizu_16th_CN" \
    PRIVATE_BUILD_DESC="meizu_16th_CN-user 10 QKQ1.191222.002 1594833800 release-keys"

BUILD_FINGERPRINT := meizu/qssi/qssi:10/QKQ1.191222.002/1594833800:user/release-keys

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    sys.usb.controller=a600000.dwc3 \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    sys.usb.rndis.func.name=gsi \
    sys.usb.rmnet.func.name=gsi
