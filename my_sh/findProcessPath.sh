#! /system/bin/sh

#查找所有root进程对应的路径和cmdline 启动命令 CLASS_PATH在 /proc/pid/environ 里面有个CLASS_PATH的参数
BUSYBOX=/data/local/tmp/busybox
PID_LIST=`ps |$BUSYBOX awk '{print $1 " " $2}' | grep root |$BUSYBOX awk '{print $2}'`
for pid in $PID_LIST; do
	# echo $pid
	data=`cat /proc/$pid/cmdline 2>>/dev/null`
	path=`readlink -f /proc/$pid/exe 2>>/dev/null` 
	[ -z "$data" ] && continue
	[ -z "$path" ] && continue
	
	echo $pid $path $data 
done
