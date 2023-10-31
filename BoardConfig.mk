#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/vivo/PD2054

# Rules
# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_USES_NETWORK := true
BUILD_BROKEN_DUP_RULES := true
# BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
# BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi
TARGET_NO_BOOTLOADER := true
# UEFI (Unified Extensible Firmware Interface)
# PBL > BOOTROM > XBL(Preloader: QSEE{keymaster}, devcfg, abl:{to.bootmode=?Charger}, rpm) > QSEE > \
# ABL (LK: fastboot)> Kernel > Android: Init, Zygote, System_server
TARGET_USES_UEFI := true

# Display
TARGET_SCREEN_DENSITY := 480
# TARGET_RECOVERY_DENSITY := xxhdpi
# xxhdpi 2408x1080 IPS/TFT 60,90Hz HDR10,HLG

#Generate DTBO image
# BOARD_KERNEL_SEPARATED_DTBO := true
SYSTEMEXT_SEPARATE_PARTITION_ENABLE = true

# Dynamic partitions
# PRODUCT_BUILD_SUPER_PARTITION := false

BOARD_DYNAMIC_PARTITION_ENABLE := true
### Dynamic partition Handling
ifneq ($(strip $(BOARD_DYNAMIC_PARTITION_ENABLE)),true)
BOARD_ODM_FILE_SYSTEM_SIZE := 1150976
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5117816832
BOARD_PRODUCTIMAGE_FILE_SYSTEM_SIZE := 176594944
BOARD_VENDORIMAGE_FILE_SYSTEM_SIZE := 1160421376
BOARD_SYSTEMEXTIMAGE_PARTITION_SIZE := 227782656
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
else
# Define the Dynamic Partition sizes and groups.
ifeq ($(ENABLE_VIRTUAL_AB), true)
     BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
else
     BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
endif

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_ext
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_EXT4_SHARE_DUP_BLOCKS := true
    ifeq ($(BOARD_KERNEL_SEPARATED_DTBO),true)
        # Enable DTBO for recovery image
        BOARD_INCLUDE_RECOVERY_DTBO := true
    endif
endif
### Dynamic partition Handling

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_PRODUCTIMAGE := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_USERDATAIMAGE_FILE_SYSTEM_SIZE := 116731424768
BOARD_CACHEIMAGE_FILE_SYSTEM_SIZE := 268435456
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMEXTIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODM_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# boot.img kernel_size: 0x8=0x027EF200(40M), ramdisk_size: 0xc=0x0C709B, os_ver: 0x10=0x16000172, header_size: 0x14=0x062C header_ver: 0x28=0x03
# recovery.img cmdline 0x2c
# DT_TABLE_MAGIC 0xd7b7ab1e, #> mkdtimg dump dtbo.img
# vendor_boot.img header_v: 0x8=3, fps: 0xc=0x1000(4096), kernerl_addr: 0x10=0x00000800, ram_addr: 0x14=0x01000000, vram_size=0x00111061(8.7Mb), cmdline: 0x1c, tag_addr=0x81c=0x00000100, boot_name=0x820(NULL), header_size: 0x830=0x000000800(16Mb), dtb_size: 0x834=0x0004BE14(0.29Mb), dtb_addr:0x838=0x01F00000, dtb.img: 0x00113000~0x15EE14
# dd bs=1 skip=1126400 count=310804 if=vendor_boot.img of=prebuilt/dtb.img
# dlkm: ramdisk/lib/modules/5.4-gki
# from vendor_boot.img, recovery.img
# Kernel
TARGET_NO_KERNEL := false
BOARD_KERNEL_CMDLINE := console=null earlycon=null androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=4e00000.dwc3 swiotlb=0 loop.max_part=7 cgroup.memory=nokmem,nosocket product.version=PD2054_A_1.20.10 fingerprint.abbr=11/RP1A.200720.012 region_ver=W10 buildvariant=user androidboot.securebootkeyhash=2c0a52ffbd8db687b56f6a98d8840f46597a4dde6d9dc8d00039873ce6d74f60 androidboot.securebootkeyver=4

BOARD_KERNEL_PAGESIZE := 4096 # 0x1000, 4k byte
BOARD_FLASH_BLOCK_SIZE := 0x40000  # (BOARD_KERNEL_PAGESIZE * 64)

# 1 or 2 supports a recovery DTBO image or a recovery ACPIO image.
# 3 doesn't support recovery images.
# Use GKI (requires the android-4.19 or android-5.4 kernel) but don't use A/B updates can specify a recovery image by using boot image version 3 for the boot image and boot image version 2 for the recovery image
# Don't use GKI and don't use A/B updates can specify a recovery image by using boot image version 1 or 2 for both boot and recovery images.
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_RAMDISK_OFFSET       := 0x01000000
#Disable appended dtb
TARGET_KERNEL_APPEND_DTB := false
# Set Header version for bootimage
ifneq ($(strip $(TARGET_KERNEL_APPEND_DTB)),true)
#Enable dtb in boot image and Set Header version
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 3
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
else
BOARD_BOOTIMG_HEADER_VERSION := 2
# include dtbo section
# per Non-A/B devices using header_version, not support in v3
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_MKBOOTIMG_ARGS += --recovery_dtbo $(BOARD_PREBUILT_DTBOIMAGE)
endif

BOARD_DTB_OFFSET           := 0x01F00000
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc LLVM=1
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r383902
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := PD2054_defconfig
# kernel/oneplus/sm4350
TARGET_KERNEL_SOURCE := kernel/vivo/PD2054

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
endif

# build vendor/lib/modules
NEED_KERNEL_MODULE_RECOVERY := true

# dyna load kernerl module(GKI)
KERNEL_MODULES_INSTALL := dlkm


# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Platform sm4350
TARGET_BOARD_PLATFORM := holi
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/
TARGET_BOARD_PLATFORM_GPU := qcom-adreno619
# TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
# QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Hack: prevent anti rollback
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
# VENDOR_SECURITY_PATCH := 2023-02-01
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab/recovery.fstab
# TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/ramdisk/recovery/init.recovery.rc
# TW_INTERNAL_STORAGE_PATH
# TW_INTERNAL_STORAGE_MOUNT_POINT
# TW_EXTERNAL_STORAGE_PATH
# TW_EXTERNAL_STORAGE_MOUNT_POINT

# $ ./avbtool.py info_image --image vbmeta.img.dd
# vbmeta.img, 0x4: major_v=0x1, 0x8: minor_v=0x0, 0xc: sb_size=0x0140, 0x14: db_size=0x1580, 0x1c: AvbAlgorithmType(AVB_VBMETA_IMAGE_FLAGS_HASHTREE_DISABLED:1)
# 0x7b: 1:=disable_verity|2:=disable_verification
# 0x80: release_str=avbtool v1.1.0
# index list: boot: 1, recovery: 2, survival: 3, dtbo: 4, vendor_boot: 11, oem: 7, vgc: 8, vbmeta_system: 10
# Public key (sha1):       6de2f95b231d98d39e18222ea16d11b340cfd82c
# Verified Boot
# BOARD_BUILD_DISABLED_VBMETAIMAGE := true
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
# default: 0, should be increased on a regular basis.
BOARD_AVB_ROLLBACK_INDEX := 0
# BOARD_AVBTOOL_BOOT_ADD_HASH_FOOTER_ARGS += --salt xxxx
# BOARD_AVBTOOL_BOOT_ADD_HASH_FOOTER_ARGS += --hash_algorithm xxx

# MakeDisabledVbmetaImage: 2
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# disable dm-verify
# --chain_partition
# BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag

BOARD_AVB_VBMETA := vendor oem vgc
BOARD_AVB_VBMETA_SYSTEM := system system_ext product

# Salt: aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7
# Digest: 07d51ce0462da9d07e2bebeb47d736266b2f8b114e6efab75305c073fdee42cb
# com.android.build.boot.security_patch: '2023-02-01'
# should define KEY_PATH for if non-A/B supported.
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 0

# Encryption
# 2: Rolling back check point support
TW_USE_FSCRYPT_POLICY := 2
BOARD_USES_METADATA_PARTITION := true

# TARGET_RECOVERY_QCOM_RTC_FIX := true
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/compatibility_matrix.xml

# Extras
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
BOARD_HAS_NO_REAL_SDCARD := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_USE_LEDS_HAPTICS := true
# TW_SUPPORT_INPUT_1_2_HAPTICS := false
# TW_SUPPORT_INPUT_AIDL_HAPTICS := false
TW_SECONDARY_BRIGHTNESS_PATH := "/sys/devices/platform/soc/5e00000.qcom\x2mdss_mdp/backlight/panel0-backlight/brightness"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 2000
TW_EXCLUDE_SUPERSU := true
RECOVERY_SDCARD_ON_DATA := true
# TW_CUSTOM_BATTERY_PATH := "/sys/devices/platform/soc/1c40000.qcom\x2spmi/spmi-0/spmi0-02/1c40000.qcom\x2spmi:qcom\x2pm7250b@2:qcom\x2qpnp-smb5/power_supply/battery"
TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/battery"

# Overlay graphics(DRM device) need getMakeVars(ctx, 
# TW_TARGET_USES_QCOM_BSP := true
# TARGET_USES_QCOM_BSP := true
BOARD_USES_VENDOR_QCOM := true

# HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE   := true
# USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
TW_NEW_ION_HEAP := true
TARGET_USES_NEW_ION_API := true

# TW_INTERNAL_STORAGE_PATH
# TW_INTERNAL_STORAGE_MOUNT_POINT
# TW_EXTERNAL_STORAGE_PATH
# TW_EXTERNAL_STORAGE_MOUNT_POINT
# TWRP_CUSTOM_KEYBOARD := $(DEVICE_PATH)/recovery/hardwarekeyboard.cpp
TW_NO_EXFAT := true
TW_PREPARE_DATA_MEDIA_EARLY := true
# TW_HAS_EDL_MODE := true
# TWRP_REQUIRED_MODULES += init.recovery.usb.rc
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Statusbar icons flags
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
#TW_FRAMERATE := 60
#TW_STATUS_ICONS_ALIGN := center
#TW_CUSTOM_CPU_POS := 50
#TW_CUSTOM_CLOCK_POS := 300
#TW_CUSTOM_BATTERY_POS := 800
# Clock offset $(( ($(date +%s) - $(cat /sys/class/rtc/rtc0/since_epoch)) ))
TW_QCOM_ATS_OFFSET := 1614645734000

# Encryption support
# libcryptfsfde libgpt_twrp
TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

#TARGET_HW_DISK_ENCRYPTION := true
# TW_INCLUDE_FBE := true
# libvolddecrypt
# TW_CRYPTO_USE_SYSTEM_VOLD := true

# Keystore
# TARGET_PROVIDES_KEYMASTER := true
# TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Resetprop(Vendor init) and Magiskboot, libresetprop
TARGET_UNIFIED_DEVICE := true
TW_OVERRIDE_SYSTEM_PROPS := true
TW_INCLUDE_REPACKTOOLS := true

# TWRP Debug Flags
# TWRP_EVENT_LOGGING := true
# TWRP_INCLUDE_LOGCAT := true
# TARGET_USES_LOGD := true
# RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
# TARGET_RECOVERY_DEVICE_MODULES += strace
# RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

BOOT_KERNEL_MODULES := "ufshcd-vivo-core.ko sarpower_class.ko sar_power.ko boardinfo.ko vkyber-iosched.ko vivo_bsp_engine.ko bfq.ko bbk_card_detect.ko vr.ko bbk_drivers_info.ko"
TW_LOAD_VENDOR_MODULES := "vivo_codec_common_dlkm.ko vivo_aw87339_dlkm.ko sensors_class.ko vivo_ts.ko q6_pdr_dlkm.ko vivo-fuel_summary.ko vivo-chg-cms.ko qcom-qpnp-qg.ko q6_notifier_dlkm.ko snd_event_dlkm.ko apr_dlkm.ko adsp_loader_dlkm.ko qcom-smb1398-charger.ko qcom-smb1355-charger.ko qpnp-smb5-main.ko bq24192_slave_charger.ko vivo_mb.ko"
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(TW_LOAD_VENDOR_MODULES)
