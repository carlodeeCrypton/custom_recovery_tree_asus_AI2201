# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0

## Device identifier. This must come after all inclusions
PRODUCT_PLATFORM := taro
PRODUCT_RELEASE_NAME := ASUS_AI2201
PRODUCT_DEVICE := AI2201
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)
PRODUCT_BRAND := Asus
PRODUCT_MODEL := ROG Phone 6
PRODUCT_MANUFACTURER := $(PRODUCT_BRAND)

# Inherit from our custom product configuration
$(call inherit-product-if-exists, vendor/pb/config/common.mk)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)
$(call inherit-product-if-exists, vendor/shrp/config/common.mk)
$(call inherit-product-if-exists, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/AI2201/device.mk)

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_AI2201-user 12 SKQ1.220406.001 32.2810.2210.216-0 release-keys"

BUILD_FINGERPRINT := asus/WW_AI2201/ASUS_AI2201:12/SKQ1.220406.001/32.2810.2210.216-0:user/release-keys
