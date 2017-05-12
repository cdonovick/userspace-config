#clean up flags
do_tab_imports = False
do_history_imports = False
do_history_path = False
do_history_funcs = False

# enable syntax completion
try:
    import readline
except ImportError:
    print("Module readline not available. No tab completion")
else:
    import rlcompleter
    print("Tab completion enabled")
    readline.parse_and_bind("tab: complete")
    do_tab_imports = True
    do_history_imports = True

# command history
if do_history_imports:
    import os
    import atexit
    import sys

    if sys.exec_prefix == '/usr':
        #use default history
        if 'CONFIG_PYTHON' in os.environ and os.environ['CONFIG_PYTHON'] is not None:
            print('Using global history')
            history_path = os.environ['CONFIG_PYTHON'] + '/history'
            do_history_path = True
        else:
            print('CONFIG_PYTHON not set, cannot create history file')
    else:
        #use virtuel env history
        print('Using virtual history')
        history_path = sys.exec_prefix + '/history'
        do_history_path = True


if do_history_path:
    if not os.path.isfile(history_path):
        try:
            with open(history_path, 'w'):
                print('Creating history file: ' + history_path)
            do_history_funcs = True
        except FileNotFoundError:
            print('File not found error when opening ' + history_path + ' for writing')
        except PermissionError:
            print('Permission error when opening ' + history_path + ' for writing')
    else:
        print('History file: ' + history_path)
        do_history_funcs = True


if do_history_funcs:
    def save_history(history_path=history_path):
        import readline
        readline.write_history_file(history_path)
        del readline

    readline.read_history_file(history_path)

    atexit.register(save_history)


#clean up
if do_tab_imports:
    del readline, rlcompleter

if do_history_imports:
    del os, atexit, sys

if do_history_path:
    del history_path

if do_history_funcs:
    del save_history

del do_tab_imports, do_history_imports, do_history_path, do_history_funcs
