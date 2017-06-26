#wrap up everythin in a function for easy cleanup
def _start_up():
    #options
    TAB_COMPLETE = True
    HISTORY = True

    PY_CONFIG_VAR = 'CONFIG_PYTHON'
    GLOBAL_HISYOTY = '/history'
    VIRTUAL_HISTORY = '/history'


    # enable syntax completion
    if TAB_COMPLETE or HISTORY:
        try:
            import readline
        except ImportError as e:
            print("ERROR: module readline not available. No tab completion or history")
            print(e)
            return

    else:
        return

    if TAB_COMPLETE:
        import rlcompleter
        readline.parse_and_bind("tab: complete")
        print("Tab completion enabled")

    if not HISTORY:
        return

    import os
    import atexit
    import sys

    #detect if running in a virtual env
    if sys.prefix != sys.base_prefix or hasattr(sys, 'real_prefix'):
        #use virtual env history
        print('Using virtual history')
        history_path = sys.exec_prefix + VIRTUAL_HISTORY

    else:
        #use default history
        try:
            history_path = os.environ[PY_CONFIG_VAR] + GLOBAL_HISYOTY
            print('Using global history')
        except KeyError as e:
            print('ERROR: environmental var ' + PY_CONFIG_VAR + ' does not exist, cannot use global history file')
            print(e)
            return
        except TypeError as e:
            print('ERROR: environmental var ' + PY_CONFIG_VAR + ' not set, cannot use global history file')
            print(e)
            return


    if not os.path.isfile(history_path):
        try:
            with open(history_path, 'w'):
                print('Creating history file: ' + history_path)
        except FileNotFoundError as e:
            print('ERROR: file not found error when opening ' + history_path + ' for writing')
            print(e)
            return
        except PermissionError as e:
            print('ERROR: permission error when opening ' + history_path + ' for writing')
            print(e)
            return
    else:
        if os.access(history_path, os.W_OK | os.R_OK):
            print('History file: ' + history_path)
        else:
            print('ERROR: history file (' + history_path + ') must be both readable and writable')
            return


    def save_history(history_path=history_path):
        import readline
        readline.write_history_file(history_path)
        del readline

    readline.read_history_file(history_path)
    atexit.register(save_history)

_start_up()
del _start_up

