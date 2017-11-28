# https://github.com/fashao/keypatch
TAT_DIR='/Applications/IDA Pro 7.0/ida.app/Contents/MacOS/plugins/'
# MYDIR=~/.dotfiles/ida_plugins
# [ ! -f $TAT_DIR/keypatch.py ] && ln -s $MYDIR/keypatch/keypatch.py $TAT_DIR
# [ ! -f $TAT_DIR/MyRebaseProgram.py ] && ln -s $MYDIR/my_ida_script/MyRebaseProgram.py $TAT_DIR
for py_path in $(find ~/.dotfiles/ida_plugins -name "*.py"); do
	py_name=`basename $py_path`
	[ ! -f $TAT_DIR$py_name ] && ln -s $py_path $TAT_DIR
done