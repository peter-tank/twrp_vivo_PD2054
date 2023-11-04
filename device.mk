#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
# $(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable updating of APEXes
# $(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
# $(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable virtual A/B OTA
# ENABLE_VIRTUAL_AB := true
# TARGET_USES_UEFI := true
# $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota_plus_non_ab.mk)

LOCAL_PATH := device/vivo/PD2054


# API
PRODUCT_SHIPPING_API_LEVEL := 30

AB_OTA_UPDATER := false
ifeq ($(AB_OTA_UPDATER),true)
# Assert
TARGET_OTA_ASSERT_DEVICE := PD2054MA

# A/B
# getprop ro.boot.slot_suffix
# fastboot --set-active=_a
AB_OTA_PARTITIONS := \
	boot \
	dtbo \
	odm \
	product \
	system \
	system_ext \
	vbmeta \
	vbmeta_system \
	vendor \
	vendor_boot

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

#Add non-hlos files to ota packages
ADD_RADIO_FILES := true

# PRODUCT_PACKAGES += \
        bootctrl.holi \
        bootctrl.holi.recovery
endif

# fastbootd
PRODUCT_PACKAGES += \
	fastbootd \
	android.hardware.fastboot@1.0-impl-mock
#        android.hardware.fastboot@1.0-impl-mock.recovery

# Health
# PRODUCT_PACKAGES += \
	android.hardware.health@2.0-impl \
	android.hardware.health@2.0-service \
	android.hardware.health@2.0-impl.recovery

# Key store
ifneq ($(TARGET_PROVIDES_KEYMASTER),true)
PRODUCT_PACKAGES += \
    keystore.sm4350
endif
# TARGET_RECOVERY_DEVICE_MODULES := libinit_sm4350
TARGET_LEGACY_KEYMASTER := false
#TARGET_KEYMASTER_V4 := true
ifeq ($(TARGET_LEGACY_KEYMASTER),true)
PRODUCT_PACKAGES += \
        android.hardware.keymaster@3.0-impl \
        android.hardware.keymaster@3.0-service
# Gatekeeper libhardware module passthrough
PRODUCT_PACKAGES += \
        android.hardware.gatekeeper@1.0-impl
else ifeq ($(TARGET_KEYMASTER_V4),true)
# Keymaster 4 passthrough service
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service-qti \
        android.hardware.keymaster@4.0-service-qti
#else
# Keymaster 3 passthrough service
#PRODUCT_PACKAGES += \
#        android.hardware.keymaster@3.0-service
endif

# HIDL
PRODUCT_PACKAGES += \
	libhidltransport \
	libhwbinder

# USE_QTI_HAPTICS Vibrator
# PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Power
# PRODUCT_PACKAGES += \
#	android.hardware.power-service-qti

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/vendor/etc/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# android_device_qcom_twrp-common
# BOARD_USES_QCOM_FBE_DECRYPTION := true
# BOARD_USES_QCOM_DECRYPTION := true
ifeq ($(BOARD_USES_QCOM_FBE_DECRYPTION),true)
    BOARD_USES_QCOM_DECRYPTION := true
    PRODUCT_PACKAGES += \
        qcom_decrypt_fbe
    include $(BUILD_PHONY_PACKAGE)
endif
ifeq ($(BOARD_USES_QCOM_DECRYPTION),true)
    # Include resetprop for prepdecrypt property setting
    TW_INCLUDE_RESETPROP := true
    PRODUCT_PACKAGES += \
        qcom_decrypt
    include $(BUILD_PHONY_PACKAGE)
endif

# Recovery Modules
 PRODUCT_HOST_PACKAGES += \
        libandroidicu

PRODUCT_PACKAGES += \
        libsqlite

PRODUCT_PACKAGES += \
        sg_write_buffer \
        f2fs_io \
        check_f2fs

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)
#	hardware/qcom-caf/bootctrl \
#	vendor/qcom/opensource/commonsys-intf/display

# OEM otacerts
# PRODUCT_EXTRA_RECOVERY_KEYS += \
#	$(LOCAL_PATH)/security/releasekey

# Recovery
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab/twrp_AB.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
else
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
endif

# Apex libraries
PRODUCT_COPY_FILES += \
	$(OUT_DIR)/target/product/PD2054/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so \
	$(OUT_DIR)/target/product/PD2054/obj/SHARED_LIBRARIES/libsqlite_intermediates/libsqlite.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libsqlite.so

TARGET_RECOVERY_DEVICE_MODULES += \
	libandroidicu \
	libsqlite \
	libcap \
	libion \
	libxml2

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/libsqlite.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

TARGET_RECOVERY_DEVICE_MODULES += \
    libbinder \
    libgui \
    libui

# TW_CRYPTO_USE_SYSTEM_VOLD := qseecomd hwservicemanager keymaster-4-0

# FDE
ifeq ($(BOARD_USES_QCOM_DECRYPTION), true)
TW_RECOVERY_ADDITIONAL_RELINK_FILES := \
    $(OUT_DIR)/target/product/PD2054/system/lib64/libbinder.so \
    $(OUT_DIR)/target/product/PD2054/system/lib64/libgui.so \
    $(OUT_DIR)/target/product/PD2054/system/lib64/libui.so \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/qseecomd \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/android.hardware.gatekeeper@1.0-service-qti \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/android.hardware.keymaster@4.0-service-qti \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/android.hardware.boot@1.0-service \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/android.hardware.health@2.0-service

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbinder.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgui.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_VENDOR_LIBRARIES)/libdrmfs.so
endif
