#!/system/bin/sh
sleep 10
cmd package compile -m everything -f -a
cmd package compile -f -a --compile-layouts
cmd package bg-dexopt-job
fstrim -v /data
fstrim -v /system
fstrim -v /cache
rm -r -f /data/dalvik-cache/*
mkdir /data/dalvik-cache
sm fstrim
pm trim-caches 99999999999999999m
