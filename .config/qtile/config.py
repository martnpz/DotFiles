import os
import re
import socket
import subprocess

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook
from libqtile.command import lazy
from libqtile.config import Screen, Click

from extra import keys, mouse, groups

### Colors
color = [
    ["#011627", "#011627"], # 0 Background
    ["#4a6670", "#4a6670"], # 1 Inactive
    ["#0091ad", "#0091ad"], # 2 Acent
    ["#17cf65", "#17cf65"], # 3 Primary
    ["#f0803c", "#f0803c"], # 4 Secondary
    ["#fbfef9", "#fbfef9"]  # 5 Font text
]

### Layouts
layout_style = {
    'border_focus': 'f0803c',
    'border_normal': '011627',
    'border_width': 3,
    'margin': 3
}

layouts = [
    #layout.Floating(),
    layout.MonadTall(**layout_style),
    layout.Matrix(**layout_style),
    layout.Max(**layout_style),
    layout.TreeTab(
        active_bg = color[2],
        bg_color = color[0],
        font = 'MesloLGS NF bold',
        fontsize = 13,
        inactive_bg = color[1],
        inactive_fg = color[5],
        padding = 16,
        padding_x = -2,
        padding_y = 20,
        sections = ["Main", "Back"],
        vspace = 3,
        **layout_style
    ),
]

### Widgets config
widget_defaults = dict(
    background = color[0],
    font = 'MesloLGS NF bold',
    fontsize = 13,
    foreground = color[5],
    padding = 3,
)
extension_defaults = widget_defaults.copy()

### All glyps as '' are in https://www.nerdfonts.com/cheat-sheet

battery = dict(
    background = color[3],
    charge_char = ' ',
    discharge_char = ' ',
    empty_char = ' ',
    fontsize = 13,
    format = '{char}{percent: 1.0%}',
    full_char = ' ',
    notify_below = True,
    low_percentage = 0.25,
    margin = 2,
    padding = 2,
    show_short_text = False,
    unknow_char = ' ',
    update_interval = 15
)

caps = dict(
    background = color[1],
    fontsize = 16,
    padding = 4,
    update_interval = 0.5
)

clock = dict(
    format = '%d/%m %a | %H:%M:%S',
    background = color[3]
)

current_layout = dict(
    background = color[4],
)

group_box = dict(
    active = color[5],
    fontsize = 28,
    highlight_method = "block",
    inactive = color[1],
    margin_x = -1,
    padding = 8,
    padding_y = 5,
    rounded = False,
    spacing = None,
    this_current_screen_border = color[3],
)

quick_exit = dict(
    background = "#D60000",
    countdown_start = 3,
    countdown_format = '{}s ',
    default_text = "  "
)

net = dict(
    background = color[2],
    mouse_callback = {'Button1': lambda qtile: qtile.cmd_spawn('settings')},
    format = '{down} {up} ',
    use_bits = False,
    padding = 1
)

sep = dict(
    linewidth = 12,
    foreground = color[0]
)

systray = dict(
    background = color[1],
    icon_size = 19,
    padding = 8
)

thermal_sensor = dict(
    background = color[4],
    metric = True,
    mouse_callback = {'Button1': lambda qtile: qtile.cmd_spawn('htop')},
    show_tag = False,
    threshold = 85
)

text_box = dict(
    text = "", # Icon: nf-oct-triangle_left
    padding = 0,
    fontsize = 20
)

wifi = dict(
    background = color[1],
    disconnected_message = '  ',
    fontsize = 20,
    foreground = color[5],
    format = '  '
)

# Background and Foreground def
def bg_fg(bg, fg):
    return {
        'background': bg,
        'foreground': fg
    }

### Screens
screens = [
    Screen(
        top = bar.Bar(
            [
                # Arch logo 
                widget.TextBox(
                                **bg_fg(color[3], color[5]),
                                fontsize = 20,
                                mouse_callback = lambda qtile:
                    qtile.cmd_spawn('-e rofi -show'),
                                padding = -6,
                                text = "  "
                        ),
                widget.TextBox(
                                **bg_fg(color[4], color[3]),
                                padding = 0,
                                fontsize = 20,
                                text = ""
                        ),

                # Current layout name
                widget.CurrentLayout(**current_layout),
                widget.TextBox(**bg_fg(color[4], color[5]),
                               fontsize = 16,
                               text = " "
                        ),
                widget.GroupBox(**group_box),

                # Window name
                widget.Sep(**sep),
                widget.WindowName(font = 'Roboto bold'),
                widget.Sep(**sep),

                # Apps tray icons
                widget.TextBox(**bg_fg(color[0], color[1]), **text_box),
                widget.Systray(**systray),
                #widget.Wlan(**wifi), # Wifi icon
                widget.CapsNumLockIndicator(**caps), # Caps Indicator
                widget.Sep(**bg_fg(color[1], color[1]), text = " "),

                # Thermal sensor widget
                widget.TextBox(**bg_fg(color[1], color[4]), **text_box),
                widget.TextBox(**bg_fg(color[4], color[5]), text = ""),
                widget.ThermalSensor(**thermal_sensor),

                # Battery widget    
                widget.TextBox(**bg_fg(color[4], color[3]), **text_box),
                widget.Battery(**battery),

                # Brandwidth widget
                widget.TextBox(**bg_fg(color[3], color[2]), **text_box),
                widget.Net(**net),

                # Clock widget
                widget.TextBox(**bg_fg(color[2], color[3]), **text_box),
                widget.TextBox(**bg_fg(color[3], color[5]), text = "",
                               fontsize = 20),
                widget.Clock(**clock),

                # LogOut widget
                #widget.TextBox(**bg_fg(color[3], "#D60000"), **text_box),
                #widget.QuickExit(**quick_exit),
            ],
            24,
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules = [
    # Run`xprop` to see the wm class
    {'wmclass': 'com.github.dahenson.agenda'},
    {'wmclass': 'confirm'},
    {'wmclass': 'Lollypop'},
    {'wmclass': 'Conky'},
    {'wmclass': 'telegram-desktop'},
    {'wmclass': 'copyq'},
    {'wmclass': 'dialog'},
    {'wmclass': 'error'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"

### Run startup script
@hook.subscribe.startup_once
def startup_once():
    home = os.path.expanduser('~')
    subprocess.call([(home + '/.config/qtile/autostart.sh')])

wmname = "LG3D"
