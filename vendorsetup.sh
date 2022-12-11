FDEVICE="AI2201"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

	export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export LC_ALL="C"

	# Maintaining Info
	export OF_MAINTAINER=Crypton
	export FOX_VERSION=$(date +%y.%m.%d)
	export FOX_BUILD_TYPE=Unofficial-Beta
	
	# Device
	export FOX_ARCH=arm64
	export FOX_VARIANT="fox_12.1"
	export TARGET_DEVICE_ALT="ASUS_AI2201,AI2201"

	# Funtions
	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_LZMA_COMPRESSION=1
	export OF_ENABLE_LPTOOLS=1

	# Display Settings
	export OF_SCREEN_H=2340
	export OF_STATUS_H=120
	export OF_STATUS_INDENT_LEFT=150
	export OF_STATUS_INDENT_RIGHT=20
	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_USE_GREEN_LED=0

	# Partitions Handling
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/bootdevice/by-name/boot"

	# A/B-Related
    export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
	export OF_VIRTUAL_AB_DEVICE=1


	# Prevent Forced-Encryption Patches
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	# Passive Decryption Support upon OTA
	export OF_OTA_RES_DECRYPT=1
	# DM-Verity Support
	export OF_FORCE_DISABLE_DM_VERITY=1
	# On-the-Air Support
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	# Prevent Self-Restarting Process
	export OF_NO_RELOAD_AFTER_DECRYPTION=1
	# Build Date and Time Override
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
	# Ignore Metada Mounting
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	# AVB2.0 Support
	export OF_PATCH_AVB20=1
	# Prevent Splash Screen Changing
	export OF_NO_SPLASH_CHANGE=1
	export OF_PATCH_VBMETA_FLAG=2
	# Decryption
	export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
	
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi
#