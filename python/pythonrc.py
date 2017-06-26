#wrap up everythin in a function for easy cleanup
def _start_up():

    # enable syntax completion
    try:
        import readline
    except ImportError:
        print("Module readline not available. No tab completion")
        return
    else:
        import rlcompleter
        print("Tab completion enabled")
        readline.parse_and_bind("tab: complete")

    import os
    import atexit
    import sys

    if sys.exec_prefix == '/usr':
        #use default history
        if 'CONFIG_PYTHON' in os.environ and os.environ['CONFIG_PYTHON'] is not None:
            print('Using global history')
            history_path = os.environ['CONFIG_PYTHON'] + '/history'
        else:
            print('CONFIG_PYTHON not set, cannot create history file')
            return
    else:
        #use virtuel env history
        print('Using virtual history')
        history_path = sys.exec_prefix + '/history'


    if not os.path.isfile(history_path):
        try:
            with open(history_path, 'w'):
                print('Creating history file: ' + history_path)
        except FileNotFoundError:
            print('File not found error when opening ' + history_path + ' for writing')
            return
        except PermissionError:
            print('Permission error when opening ' + history_path + ' for writing')
            return
    else:
        print('History file: ' + history_path)


    def save_history(history_path=history_path):
        import readline
        readline.write_history_file(history_path)
        del readline

    readline.read_history_file(history_path)
    atexit.register(save_history)

_start_up()
del _start_up

