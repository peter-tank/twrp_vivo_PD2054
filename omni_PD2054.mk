#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from PD2054 device
$(call inherit-product, device/vivo/PD2054/device.mk)

PRODUCT_DEVICE := PD2054
PRODUCT_NAME := omni_PD2054
PRODUCT_BRAND := vivo
PRODUCT_MODEL := V2054A
PRODUCT_MANUFACTURER := vivo

PRODUCT_GMS_CLIENTID_BASE := android-vivo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="PD2054-user 11 RP1A.200720.012 compiler06051639 release-keys"

BUILD_FINGERPRINT := vivo/PD2054/PD2054:11/RP1A.200720.012/compiler06051639:user/release-keys
