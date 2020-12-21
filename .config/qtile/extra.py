from libqtile.config import Click, Drag, Group, Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

### Shortcuts
# In terminal, run 'xev' for display your keys.
# If does not exists, add it in /usr/include/X11/keysymdef.h.

win = "mod4"
terminal = guess_terminal()

keys = [Key(key[0], key[1], *key[2:]) for key in [

    # Switch between windows in current stack pane    
    ([win], "Right", lazy.layout.down()),
    ([win], "Left", lazy.layout.up()),

    # Move windows up or down in current stack
    ([win, "shift"], "Up", lazy.layout.shuffle_down()),
    ([win, "shift"], "Down", lazy.layout.shuffle_up()),

    # Tree layout controls
    ([win, "control"], "Up", lazy.layout.section_up()),
    ([win, "control"], "Down", lazy.layout.section_down()),

    # Switch window focus to other pane(s) of stack
    ([win], "space", lazy.layout.next()),

    # Swap panes of split stack
    ([win, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack
    ([win, "shift"], "Return", lazy.layout.toggle_split()),

    # Toggle between different layouts as defined below
    ([win], "Tab", lazy.next_layout()),

    # Close focused window
    ([win], "w", lazy.window.kill()),

    # Launch terminal
    ([win], "Return", lazy.spawn(terminal)),

    # Launch Apps
    ([win], "r", lazy.spawn("rofi -show drun")),

    # Launch App in window
    ([win, "shift"], "r", lazy.spawn("rofi -show")),

    # Screenshots
    ([win, "shift"], "s", lazy.spawn("flameshot gui")),

    # Clipboard with copyq
    ([win], "v", lazy.spawn("copyq show")),

    # Htop
    ([win, "shift"], "h", lazy.spawn(f'{terminal} -e htop')),

    # Restart Qtile
    ([win, "shift"], "Home", lazy.restart()),

    # Power Menu
    ([win, "shift"], "p", lazy.spawn("power.sh")),

    # Notification center
    ([win], "n", lazy.spawn("notification_center.sh")),

    # Launch Firefox
    ([win], "f", lazy.spawn("firefox")),

    # Launch Telegram
    ([win], "t", lazy.spawn("telegram-desktop")),

    # Start blue light filter 
    ([win], "l", lazy.spawn("redshift -l 32.23323:11.23322")),

    # Stop blue light filter
    ([win, "shift"], "l", lazy.spawn("killall redshift")),

    # Emoji list
    ([win], "period", lazy.spawn("copymoji.sh")),

    # Graphic Explorer: Thunar
    ([win], "e", lazy.spawn("thunar")),

    # CLI Explorer: Ranger
    ([win, "shift"], "e", lazy.spawn(f'{terminal} -e ranger')),

    # Kill a procces.
    ([win], "k", lazy.spawn("killapp.sh")),

    # Super Kill procces. (You can kill the WM or anything).
    # Need 'xorg-xkill' package.
    ([win, "shift"], "k", lazy.spawn("xkill")),

    # Brightness pop up with Popfy. 
    ([], "XF86MonBrightnessDown", lazy.spawn("popfy.sh brightness")),
    ([], "XF86MonBrightnessUp", lazy.spawn("popfy.sh brightness")),

    # Volume pop up with Popfy.
    ([], "XF86AudioRaiseVolume", lazy.spawn("popfy.sh volume up")),
    ([], "XF86AudioLowerVolume", lazy.spawn("popfy.sh volume down")),

    # Volume mute, caps and num lock indicator.
    ([], "XF86AudioMute", lazy.spawn("keys-popfy.sh mute")),
    #([], "Caps_Lock", lazy.spawn("keys-popfy.sh caps")),
    #([], "Num_Lock", lazy.spawn("keys-popfy.sh num")),

    # Color picker with Copycolor.
    ([win], "p", lazy.spawn("copycolor.sh")),

]]

### Drag floating layouts.
mouse = [
    Drag([win], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([win], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([win], "Button2", lazy.window.bring_to_front())
]

### Groups
group_names = "    ".split()

groups = [Group(name, layout = 'MonadTall') for name in group_names]

for i, name in enumerate(group_names):
    keys +=[
            Key([win], str(i + 1), lazy.group[name].toscreen()),
            Key([win, "shift"], str(i + 1), lazy.window.togroup(name))
    ]
