#! /bin/bash
# selects an android device

PROGNAME=$(basename $0)
UNAME=$(uname)
DEVICE_OPT=
for opt in "$@"
do
   case "$opt" in
      -d|-e|-s)
         DEVICE_OPT=$opt
         ;;
   esac
done
[ -n "$DEVICE_OPT" ] && exit 0
DEV=$(adb devices 2>&1 | tail -n +2 | sed '/^$/d')
if [ -z "$DEV" ]
then
   echo "$PROGNAME: ERROR: There's no connected devices." >&2
   exit 1
fi
N=$(echo "$DEV" | wc -l | sed 's/ //g')

case $N in
1)
   # only one device detected
   D=$DEV
   ;;

*)
   # more than one device detected
   OLDIFS=$IFS
   IFS="
"
   PS3="Select the device to use, <Q> to quit: "
   select D in $DEV
   do
      [ "$REPLY" = 'q' -o "$REPLY" = 'Q' ] && exit 2
      [ -n "$D" ] && break
   done

   IFS=$OLDIFS
   ;;
esac

if [ -z "$D" ]
then
   echo "$PROGNAME: ERROR: target device coulnd't be determined" >&2
   exit 1
fi

# this didn't work on Darwin
# echo "-s ${D%% *}"
echo "-s $(echo ${D} | sed 's/ .*$//')"
