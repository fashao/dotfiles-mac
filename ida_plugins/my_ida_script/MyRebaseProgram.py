import idaapi

class MyForm(Form):
    def __init__(self, ea):
        info = idaapi.get_inf_structure()
        if info.is_32bit():
            width = 10
        elif info.is_64_bit():
            width = 18
        else:
            width = 6
        Form.__init__(self,r"""STARTITEM {id:iNewHex}
RebaseAddr

Please Input Addr
<Old(Hex):{iOldHex}>
<New(Hex):{iNewHex}>""", {
        'iOldHex': Form.NumericInput(tp=Form.FT_HEX, width=width, value=ea),
        'iNewHex': Form.NumericInput(tp=Form.FT_HEX, width=width, value=ea+0x100),
        })

def plugin_run(arg):
    ea = idaapi.get_screen_ea()
    f = MyForm(ea)
    f.Compile()
    ok = f.Execute()
    if ok == 1:
        idaapi.rebase_program(f.iNewHex.value - f.iOldHex.value, idaapi.MSF_FIXONCE)
    f.Free()

class MyRebaseProgram(idaapi.plugin_t):
    flags = idaapi.PLUGIN_UNL | idaapi.PLUGIN_MOD
    comment = "RebaseProgram"
    help = "Sample Debuggee"
    wanted_name = "RebaseProgram"
    wanted_hotkey = "Shift-Alt-R"

    def init(self):
        return idaapi.PLUGIN_OK

    def term(self):
        pass

    def run(self, arg):
        plugin_run(arg)
	
def PLUGIN_ENTRY():
    return MyRebaseProgram()
