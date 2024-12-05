include $HOME/.config/i3/`hostname`.conf
include $HOME/.config/i3/keybinds.conf
include $HOME/.config/i3/theme.conf
include $HOME/.config/i3/i3bar.conf
include $HOME/.config/i3/autorun.conf

set $myBrowser          "firedragon"
set $myTerm             "alacritty"
set $fileManager        "thunar"
set $mod                Mod4

#hide_edge_borders smart
hide_edge_borders both
default_border none
smart_borders on
smart_gaps on
workspace_auto_back_and_forth yes
focus_follows_mouse yes
default_border pixel 2
default_floating_border normal 0
font pango:monospace 8
focus_on_window_activation smart
floating_modifier $mod

# workspace names
set $ws1 "1:"
set $ws2 "2:󰖟"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5:󱜠"
set $ws6 "6"
set $ws7 "7:󰭹"
set $ws8 "8"
set $ws9 "9:"
set $ws10 "10:"

# Scratchpads
bindsym $mod+m [class="fm"] scratchpad show; move position center
bindsym $mod+v [class="vol"] scratchpad show; move position center
bindsym $mod+Shift+p [class="Bitwarden"] scratchpad show; move position center
bindsym $mod+Shift+s [class="mus"] scratchpad show; move position center
exec_always --no-startup-id pgrep -f '^alacritty --class fm,fm' || alacritty --class fm,fm -e ranger
exec_always --no-startup-id pgrep -f '^alacritty --class vol,vol' || alacritty --class vol,vol -e pulsemixer
exec_always --no-startup-id pgrep -f '^alacritty --class mus,mus' || alacritty --class mus,mus -e ncspot
exec_always --no-startup-id bitwarden-desktop

# Specific windows
no_focus   [window_role="pop-up"]
for_window [window_role="^Preferences$"] floating enable, border pixel 1
for_window [class="^.*"] border pixel 2
for_window [class="Spotify|cutefish-calculator|kcalc|Galculator|systemsettings|Streamdeck UI|Cheese|deepin-camera|steam|Cinnamon-settings.py|Bitwarden"] floating enable, border pixel 1
for_window [class="Nextcloud|Blueman-manager"] floating enable, border pixel 0
for_window [title="Friends List"] floating enable
for_window [class="GParted"] floating enable, resize set 1550 900, border pixel 0, move position center
for_window [class="Streamdeck UI"] floating enable, resize set 500 508
for_window [class="org.remmina.Remmina|vlc|Thunar"] floating enable, border pixel 3
for_window [class="fm|vol|mus|Bitwarden"] floating enable, resize set 1250 700, move scratchpad, border pixel 5

# Assign workspaces
assign [class="LibreWolf|^[Ff]irefox.*|^Brave.*|firedragon|Chromium"] 2
assign [class="obsidian"] 4
assign [class="obs$"] 6
assign [class="Signal|discord"] 7
assign [class="Spotify"] 9
assign [class="steam"] 10
