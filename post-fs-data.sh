#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
mount -o bind /system/etc/security/cacerts /apex/com.android.conscrypt/cacerts

MODDIR=${0%/*}

mkdir -p $MODDIR/system/etc/security/cacerts
rm $MODDIR/system/etc/security/cacerts/*
cp -f /data/misc/user/0/cacerts-added/* $MODDIR/system/etc/security/cacerts/

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread
mount -t overlay overlay -o lowerdir=/system/etc/security/cacerts:/data/misc/user/0/cacerts-added /system/etc/security/cacerts
