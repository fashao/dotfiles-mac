alias shaka='java -jar ~/tools/shaka/ShakaApktool_2.0.0-master-f8a78ad-20160324-release.jar ' 
alias signapk='~/tools/signapk/sign.sh ' 
alias install='~/.dotfiles/my_sh/install.sh '
if [[ ! -d $1 ]]; then
	echo "$1 must be dir"
	exit 0
fi
shaka b -o $1_killer.apk $1
signapk $1_killer.apk
install $1_killer_signed.apk
