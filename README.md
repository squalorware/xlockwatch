# xlockwatch

A utility script to use if you run XScreenSaver on Desktop Environments like KDE 
or Gnome. For example, enabling XScreenSaver to run with KDE requires disabling 
KDE's own screen saver/screen lock manager, which effectively throws switching 
layouts in XScreenSaver out of the window. In case your password was in English 
(US), and you locked your screen with Ukrainian, or Swedish, or any other 
keyboard layout, you're kinda cooked since they have different character 
mappings. Hence...

### Installation

... is quite simple. You need to

1. Clone the repository anywhere and `cd` into the project's root directory 
2. Run `make` (Creates a user specific systemd service file)
3. Run `make install` - it's going to
    1. Copy the watcher script to your `$HOME/.local/bin` if the directory 
exists. Otherwise, the script will create it first. The script will be made 
executable.
    2. Copy the systemd service unit file to your local unit files directory 
`$HOME/.config/systemd/user`, if it exists, or create it first.
    3. Enable and start the service.
