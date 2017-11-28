#! /bin/sh
alias oat2dex='~/tools/oat2dex/oat2dexes-master/oat2dexes  '
SHAKA="java -jar $HOME/tools/shaka/ShakaApktool_2.0.0-master-f8a78ad-20160324-release.jar "
if [[ ! -d $1 ]]; then
	echo "$1 not exsited!"
	exit 0 
fi
apks=`find $1 -name "*.apk"`
for path in $apks; do
	echo "find $path"
	name=$(basename $path .apk)
	projDir=apks/$name
	$SHAKA apktool d $path -o $projDir
done
odexs=`find $1 -name "*.odex" -o -name "*.oat"`
echo 'decode odex'
for odex_path in $odexs; do
	name=$(basename $odex_path .odex)
	echo $odex_path
	projDir=apks/$name
	[ ! -d $projDir ] && mkdir -p $projDir
	cp $odex_path $projDir/${name}.odex
	oat2dex $projDir/${name}.odex
	mv dex01.dex $projDir/${name}.dex
	echo "dex:$projDir/${name}.dex"
	echo "path:$projDir/$name"
	$SHAKA bs $projDir/${name}.dex -f -o $projDir/$name
done