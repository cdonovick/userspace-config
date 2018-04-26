#wrap up everythin in a function for easy cleanup
def _start_up():
    #options
    EXPORT_CLEAR = True
    TAB_COMPLETE = True
    HISTORY = True
    USE_CONFIG_VAR = True

    SYS_CLEAR_CMD = 'clear'
    PY_CONFIG_VAR = 'CONFIG_PYTHON'
    GLOBAL_HISTORY = '/history'
    VIRTUAL_HISTORY = '/history'


    if EXPORT_CLEAR:
        import shutil
        if  shutil.which(SYS_CLEAR_CMD) is None:
            print('ERROR: SYS_CLEAR_CMD not available. ICLEAR not exported')
        else:
            global ICLEAR
            def ICLEAR():
                import os
                _ = os.system(SYS_CLEAR_CMD)
                del os
        del shutil

    if TAB_COMPLETE or HISTORY:
        try:
            import readline
        except ImportError as e:
            print("ERROR: module readline not available. No tab completion or history")
            print(e)
            return

    else:
        return

    # enable syntax completion
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
    if  hasattr(sys, 'real_prefix') or (hasattr(sys, 'base_prefix') and sys.prefix != sys.base_prefix):
        #use virtual env history
        print('Using virtual history')
        history_path = sys.exec_prefix + VIRTUAL_HISTORY

    else:
        #use default history
        if USE_CONFIG_VAR:
            try:
                history_path = os.environ[PY_CONFIG_VAR] + GLOBAL_HISTORY
                print('Using global history')
            except KeyError as e:
                print('ERROR: environmental var ' + PY_CONFIG_VAR + ' does not exist, cannot use global history file')
                print(e)
                return
            except TypeError as e:
                print('ERROR: environmental var ' + PY_CONFIG_VAR + ' not set, cannot use global history file')
                print(e)
                return
        else:
            history_path = GLOBAL_HISTORY


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


try:
    _start_up()
except Exception as e:
    print('Uncaught Exception in start up script')
    print(e)
    del e
finally:
    del _start_up

