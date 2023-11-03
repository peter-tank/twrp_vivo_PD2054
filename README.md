# Android device tree for vivo V2054A (PD2054)

```
#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```

```
#/adb_debug.prop
#/debug_ramdisk/adb_debug.prop
#property.recovery.gui_initialized
#property.recovery.gui_mode
#property.recovery.power_key_long_hold
#property.recovery.repair_mode
#property.recovery.silent_mode
#property.ro.build.version.sdk
#property.ro.crypto.type
#property.ro.recovery.debug_level

#/tmp/openrecoveryscript
#/tmp/downloader.log
#/tmp/guardianangle.log
#/tmp/recovery.log
#/tmp/urldownloader.log

#/system/lib64/librecovery_ui_bridge.so
#/system/lib64/librecovery_ui.so
#/system/bin/guardianangle
#/system/bin/recovery

com.vivo.devicereg=
debug.adbd.logging=
debug.atrace.app_%d=
debug.atrace.app_number=
debug.atrace.tags.enableflags=0
debug.debuggerd.disable=
debug.debuggerd.wait_for_gdb=
debug.fdsan=
debug.ld.all=
debug.ld.app.=
debug.ld.greylist_disabled=
debug.pf.disasm=
libc.debug.hooks.enable=
libc.debug.malloc.options=
libc.debug.malloc.program=
libc_malloc_debug.so=
persist.adb.tcp.port=
persist.adb.tls_server.enable=0
persist.adb.trace_mask=
persist.adb.wifi.guid=adb-a06eb4aa-iOaFwo
persist.debug.adbd.logging=
persist.debug.trace=
persist.log.ratelimit.camera.app=
persist.log.ratelimit.camera=
persist.log.ratelimit=
persist.logd.filter=
persist.logd.security=
persist.logd.size=-1
persist.logd.timestamp=
persist.sys.boot.reason=
persist.sys.dumpUmountDebugInfo=
persist.sys.locale=en-US
persist.sys.log.ctrl=no
persist.sys.ril.ddslock=
persist.sys.shipped=
persist.sys.theme.color=color01
persist.sys.timezone=Asia/Shanghai
persist.sys.usb.config=adb
persist.sys.vivo.product.cust=N
persist.vendor.cnss-daemon.debug_level=
persist.vendor.cnss-daemon.hw_trc_disable_override=
persist.vendor.cnss-daemon.kmsg_logging=
persist.vendor.data.target=
persist.vendor.net.logmask=
persist.vendor.pd_locater_debug=
persist.vendor.vivo.oem_update=
persist.vendor.vivo.qmi.fw.log=1
persist.vendor.wlan.chain=
persist.vivo.animation.custom=
persist.vivo.charge.version=0
persist.vivo.cota.clear=
persist.vivo.cota.cust1=N
persist.vivo.cota.package.version=
persist.vivo.custom.phonelock=
persist.vivo.durationtime.=
persist.vivo.durationtime.Bootloader=0
persist.vivo.durationtime.RestoreconData=0
persist.vivo.emm.hard_set=
persist.vivo.netlock=CTCC_CMCC_UNICOM
persist.vivo.product.cust=N
ro.actionable_compatible_property.enabled=true
ro.adb.secure=1
ro.apex.updatable=
ro.app.recovery.upgrade=
ro.arch=
ro.at.mode=
ro.baseband=msm
ro.board.platform=holi
ro.boot.avb_version=1.1
ro.boot.baseband=msm
ro.boot.bootdevice=4804000.ufshc
ro.boot.bootloader=
ro.boot.console=ttyMSM0
ro.boot.deviceid=
ro.boot.dynamic_partitions=true
ro.boot.dynamic_partitions_retrofit=
ro.boot.fake_battery=
ro.boot.fbadb=
ro.boot.flash.locked=0
ro.boot.hardware=qcom
ro.boot.init_rc=
ro.boot.mode=
ro.boot.product.hardware.sku=
ro.boot.product.vendor.sku=
ro.boot.quiescent=
ro.boot.recovery_mode=
ro.boot.revision=
ro.boot.secureboot_enable=1
ro.boot.serialno=12345678
ro.boot.slot_suffix=
ro.boot.vbmeta.avb_version=1.0
ro.boot.vc.magic=ota.
ro.boot.vconen=
ro.boot.verifiedbootstate=orange
ro.bootimage.build.fingerprint=vivo/PD2054/PD2054:11/RP1A.200720.012/compiler06051639:user/release-keys
ro.bootloader=unknown
ro.bootmode=unknown
ro.boottime.init.cold_boot_wait=789
ro.boottime.init.first_stage=1235652448
ro.boottime.init.fsck.=
ro.boottime.init.mount.=
ro.boottime.init.mount_all.=
ro.boottime.init.selinux=231251666
ro.boottime.init=1768081561
ro.boringcrypto.hwrand=
ro.build.ab_update=
ro.build.date.utc=1685954389
ro.build.description=PD2054-user 11 RP1A.200720.012 eng.compil.20230605.163949 release-keys
ro.build.display.id=RP1A.200720.012 release-keys
ro.build.display_build_number=
ro.build.expect.baseband=
ro.build.fingerprint=vivo/PD2054/PD2054:11/RP1A.200720.012/compiler06051639:user/release-keys
ro.build.flavor=qssi-user
ro.build.gn.support=
ro.build.id=RP1A.200720.012
ro.build.keys=release-keys
ro.build.oem.projects=PD2054 PD2054B
ro.build.product=PD2054
ro.build.shutdown.watchdog.timeout=
ro.build.shutdown_timeout=
ro.build.system_root_image=false
ro.build.tags=release-keys
ro.build.type=user
ro.build.version.bbk=PD2054B_A_1.20.10
ro.build.version.group=
ro.build.version.incremental=eng.compil.20230605.163949
ro.build.version.release=11
ro.build.version.sdk=30
ro.build.version.security_patch=2023-02-01
ro.cold_boot_done=true
ro.config.low_ram=
ro.config.per_app_memcg=
ro.cpuset.default=
ro.crypto.dm_default_key.options_format.version=2
ro.crypto.metadata.enabled=true
ro.crypto.policy.ensure_fail=
ro.crypto.scrypt_params=
ro.crypto.set_dun=
ro.crypto.state=encrypted
ro.crypto.type=file
ro.crypto.volume.metadata.encryption=
ro.ddrcheck.result=
ro.debuggable=0
ro.device_owner=
ro.engineermode_AT.upgrade=
ro.factory.at=
ro.factory.bbk_dp=0
ro.factory.bsptmode=
ro.fsg.flag=
ro.gsid.image_running=0
ro.hardware.bbk=PD2054MA
ro.hardware=qcom
ro.init.shutdown_animation=
ro.kernel.qemu=
ro.logd.auditd.dmesg=
ro.logd.auditd.events=
ro.logd.auditd.main=
ro.logd.auditd=
ro.logd.filter=
ro.logd.kernel=
ro.logd.size=1024K
ro.logd.timestamp=
ro.mediatek.platform=
ro.minui.default_rotation=
ro.minui.overscan_percent=
ro.minui.pixel_format=RGBX_8888
ro.oem.recovery.upgrade=
ro.oem_unlock_supported=1
ro.organization_owned=false
ro.ota.recovery.upgrade=
ro.persistent_properties.ready=true
ro.preinstall.path=/data/yzfswj/another/
ro.product.board=holi
ro.product.brand=vivo
ro.product.country.region=CN-ZH
ro.product.cpu.abi=arm64-v8a
ro.product.customize.bbk=N
ro.product.device=PD2054
ro.product.first_api_level=30
ro.product.model.bbk=PD2054
ro.product.model=V2054A
ro.product.name=PD2054
ro.product.property_source_order=
ro.product.vendor.device=PD2054
ro.property_service.version=2
ro.recovery.AFTool.upgrade=
ro.recovery.backup.upgrade=
ro.recovery.debug_level=
ro.recovery.emergent_mode=
ro.recovery.support.tf=
ro.recovery.ui.animation_fps=
ro.recovery.ui.margin_height=
ro.recovery.ui.margin_width=
ro.recovery.ui.menu_unusable_rows=
ro.recovery.ui.progress_bar_baseline=
ro.recovery.ui.stereo_offset=
ro.recovery.ui.touch_high_threshold=
ro.recovery.ui.touch_low_threshold=
ro.recovery.vgc.support=
ro.recovery.vivo.custom_limit=
ro.revision=0
ro.secure=1
ro.serialno=12345678
ro.sf.lcd_density=480
ro.system.build.fingerprint=vivo/PD2054/PD2054:11/RP1A.200720.012/compiler06051639:user/release-keys
ro.thermal_warmreset=
ro.treble.enabled=true
ro.vendor.build.fingerprint=vivo/PD2054/PD2054:11/RP1A.200720.012/compiler06051639:user/release-keys
ro.vendor.build.security_patch=2023-02-01
ro.vendor.extension_library=libqti-perfd-client.so
ro.vendor.rpmb.customize=PD2054B_CN-ZH_FULL_SC_NULL
ro.vendor.seed.customize.vgc=NULL
ro.vendor.vivo.board_version=110110111111
ro.vendor.vivo.product.model=PD2054
ro.vgc.cust.name=NULL
ro.vgc.device.name=NULL_PD2054MA
ro.vgc.product.version=
ro.vgc.recovery.upgrade=
ro.vgc.update.mode=
ro.virtual_ab.allow_non_ab=
ro.virtual_ab.enabled=
ro.vivo.at_mode_state=
ro.vivo.at_modem_type=
ro.vivo.boot.dp_type=
ro.vivo.build.cust=
ro.vivo.build.version.incremental=1.20.10
ro.vivo.build.version=
ro.vivo.cmcc.dm.name=com.vivo.devicereg
ro.vivo.cota.enable=1
ro.vivo.ctcc.dm.name=com.vivo.devicereg
ro.vivo.dm.config=CMCC-CTCC-UNICOM
ro.vivo.durationtime.=
ro.vivo.durationtime.InitSecondStage=3
ro.vivo.force_enable_fastchg=
ro.vivo.hardware.version=PD2054MA
ro.vivo.hardware_version=MP_0.1
ro.vivo.low_ram=true
ro.vivo.oem.name=PD2054B_CN-ZH_FULL_SC_NULL
ro.vivo.op.dm=6
ro.vivo.op.entry=FULL_SC
ro.vivo.os.name=Funtouch
ro.vivo.ota.status=0
ro.vivo.product.model=PD2054
ro.vivo.product.overseas=no
ro.vivo.product.platform=SM4350
ro.vivo.product.solution=QCOM
ro.vivo.product.version.incremental=
ro.vivo.product.version=PD2054B_A_1.20.10
ro.vivo.product.vpatch=
ro.vivo.recovery.last_action=
ro.vivo.rom.version=
ro.vivo.secscreen=
ro.vivo.unicom.dm.name=com.mobiletools.systemhelper
ro.vivo.vgc.activate=true
ro.vndk.lite=
ro.vndk.version=30
ro.vold.forceencryption=
ro.zygote=zygote64_32
sys.vivo.bsptest.adb_no_auth=
vendor.vivo.softap.maxsta=
```

```
.
├── Android.bp
├── Android.mk
├── AndroidProducts.mk
├── BoardConfig.mk
├── README.md
├── bin
├── depends.sh
├── device.mk
├── extract-files.sh
├── fstab
│   ├── recovery.fstab
│   └── twrp.flags
├── gets
├── log
├── new
├── omni_PD2054.mk
├── prebuilt
│   ├── Image.gz
│   ├── dtb.img
│   └── dtbo.img
├── prop
├── props_platform.txt
├── ramdisk
├── recovery
│   └── root
│       ├── init.recovery.platform.rc
│       ├── init.recovery.qcom.rc
│       ├── init.recovery.svc.rc
│       ├── init.recovery.touch.rc
│       ├── init.recovery.usb.rc
│       ├── init.recovery.wifi.rc
│       ├── init.vivo.rc
│       ├── prop.default
│       ├── sepolicy
│       ├── system
│       │   ├── bin
│       │   │   ├── guardianangle
│       │   │   ├── init
│       │   │   ├── make_f2fs
│       │   │   ├── sload_f2fs
│       │   │   ├── vivofbe
│       │   │   └── vts_app_recovery
│       │   ├── etc
│       │   │   ├── prop.default
│       │   │   ├── ueventd.rc
│       │   │   └── vintf
│       │   │       ├── manifest
│       │   │       │   └── manifest.xml
│       │   │       └── manifest.xml
│       │   └── lib64
│       │       ├── libGuardianAngleService.so
│       │       ├── libGuardianAngleServiceImpl.so
│       │       ├── libhardware_legacy.so
│       │       ├── libkeymasterdeviceutils.so
│       │       ├── libkeymasterutils.so
│       │       ├── libqcbor.so
│       │       ├── libqtikeymaster4.so
│       │       ├── librpmb.so
│       │       ├── libsqlite.so
│       │       ├── libvivofscrypt.so
│       │       └── libvivogatekeeper.so
│       ├── ueventd.qcom.rc
│       └── vendor
│           ├── bin
│           │   ├── android.hardware.gatekeeper@1.0-service-qti
│           │   ├── android.hardware.keymaster@4.0-service-qti
│           │   ├── init.qcom.usb.sh
│           │   └── qseecomd
│           ├── etc
│           │   ├── gpfspath_oem_config.xml
│           │   ├── powerhint.xml
│           │   ├── task_profiles.json
│           │   ├── vintf
│           │   │   ├── compatibility_matrix.xml
│           │   │   ├── manifest
│           │   │   │   ├── power.xml
│           │   │   │   └── vendor.qti.hardware.vibrator.service.xml
│           │   │   └── manifest.xml
│           │   └── wifi
│           │       ├── WCNSS_qcom_cfg.ini
│           │       └── wpa_supplicant.conf
│           ├── firmware
│           │   ├── TP-FW-PD2054-LCMID129-VER0x28.bin
│           │   ├── TP-FW-PD2054-LCMID17-VER0x66.bin
│           │   ├── TP-FW-PD2054-LCMID18-VER0x66.bin
│           │   ├── TP-FW-PD2054-LCMID65-VER0x28.bin
│           │   ├── TP-FW-PD2054-LCMID66-VER0x2a.bin
│           │   ├── TP-FW-PD2054-LCMID67-VER0x21.bin
│           │   ├── TP-MP-FW-PD2054-LCMID129-VER0x24.bin
│           │   ├── TP-MP-FW-PD2054-LCMID17-VER0x60.bin
│           │   ├── TP-MP-FW-PD2054-LCMID18-VER0x60.bin
│           │   ├── TP-MP-FW-PD2054-LCMID65-VER0xe0.bin
│           │   └── touch_firmwares_recovery.bin
│           ├── lib
│           │   └── modules
│           │       ├── cnss_utils.ko
│           │       ├── icnss2.ko
│           │       ├── qca_cld3_wlan.ko
│           │       ├── qcom-qpnp-qg.ko
│           │       ├── qpnp-smb5-main.ko
│           │       ├── sensors_class.ko
│           │       ├── vivo-chg-cms.ko
│           │       ├── vivo-fuel_summary.ko
│           │       ├── vivo_mb.ko
│           │       └── vivo_ts.ko
│           └── lib64
│               ├── libGPreqcancel.so
│               ├── libGPreqcancel_svc.so
│               ├── libQSEEComAPI.so
│               ├── libStDrvInt.so
│               ├── libdiag.so
│               ├── libdrmfs.so
│               ├── libdrmtime.so
│               ├── libqisl.so
│               ├── libsecureui.so
│               ├── libsecureui_svcsock.so
│               ├── libssd.so
│               ├── libtime_genoff.so
│               ├── vendor.display.config@1.0.so
│               └── vendor.qti.hardware.tui_comm@1.0.so
├── setup-makefiles.sh
├── so
├── stock.sh
├── sync2ramdisk.sh
├── system.prop
├── twrp_PD2054.mk
├── vendor.prop
├── vendorsetup.sh
└── whitelist

21 directories, 109 files
```
