adb push ~/tools/ida_mac/as7.0 /data/local/tmp/as7.0
adb forward tcp:23946 tcp:23946
adb shell "chmod 777 /data/local/tmp/as7.0"
adb shell "fu -c 'chmod 777 /data/local/tmp/as7.0'"
adb shell "fu -c '/data/local/tmp/as7.0'"
adb shell "su -c 'chmod 777 /data/local/tmp/as7.0'"
adb shell "su -c '/data/local/tmp/as7.0'"
