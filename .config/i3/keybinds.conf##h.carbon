# common operations
bindsym $mod+q                kill
bindsym $mod+Shift+r          restart
bindsym Print                 exec --no-startup-id flameshot gui
bindsym $mod+c                exec --no-startup-id ~/.config/rofi/scripts/configs.sh
bindsym $mod+d                exec --no-startup-id "dmenu_run -fn 'SpaceMono Nerd Font-11' -nf '#81a1c1' -nb '#434c5e' -sb '#5e81ac' -sf '#88c0d0'"
bindsym $mod+Shift+d          exec --no-startup-id "rofi -modi drun,run -show drun -show-icons"
#bindsym $mod+Ctrl+d          exec --no-startup-id "xlunch ~/.config/xlunch/default.config"
bindsym $mod+period           exec --no-startup-id "rofi -fn -modi emoji -show emoji"
#bindsym $mod+Ctrl+l          exec --no-startup-id betterlockscreen -l dimblur
bindsym $mod+Ctrl+Escape      exec --no-startup-id "archlinux-logout"
bindsym $mod+Ctrl+0           exec --no-startup-id "archlinux-logout"

# application shortcuts
bindsym $mod+Return           exec --no-startup-id $myTerm
bindsym $mod+Print            exec --no-startup-id screenkey
bindsym $mod+b                exec --no-startup-id $myBrowser
#bindsym $mod+m               exec $fileManager

# Multimedia keys
set $refresh_i3status         killall -SIGUSR1 i3status
bindsym XF86AudioPlay         exec --no-startup-id playerctl play-pause
bindsym XF86AudioNext         exec --no-startup-id playerctl next
bindsym XF86AudioPrev         exec --no-startup-id playerctl previous
bindsym XF86AudioStop         exec --no-startup-id playerctl stop
bindsym XF86AudioRaiseVolume  exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume  exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute         exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute      exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
bindsym XF86MonBrightnessUp   exec --no-startup-id xbacklight -inc 10
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 10

# container focus
bindsym $mod+h                focus left
bindsym $mod+j                focus down
bindsym $mod+k                focus up
bindsym $mod+l                focus right
bindsym $mod+space            focus mode_toggle
bindsym $mod+a                focus parent
#bindsym $mod+d               focus child

# container resizing
bindsym $mod+Shift+Down       resize shrink height 8 px or 8 ppt
bindsym $mod+Shift+Up         resize grow height 8 px or 8 ppt
bindsym $mod+Shift+Left       resize shrink width 8 px or 8 ppt
bindsym $mod+Shift+Right      resize grow width 8 px or 8 ppt
bindsym $mod+r                mode "resize"

# container layout
bindsym $mod+f                fullscreen toggle
bindsym $mod+Shift+h          move left
bindsym $mod+Shift+j          move down
bindsym $mod+Shift+k          move up
bindsym $mod+Shift+l          move right
#bindsym $mod+o               sticky toggle
bindsym $mod+Shift+space      floating toggle
bindsym $mod+Shift+plus       split toggle; exec --no-startup-id "notify-send 'Toggled split'"
bindsym $mod+s                layout stacking; exec --no-startup-id "notify-send 'Stacking mode'"
bindsym $mod+t                layout tabbed; exec --no-startup-id "notify-send 'Tab mode'"
bindsym $mod+e                layout toggle split; exec --no-startup-id "notify-send 'Split Toggle'"
#bindsym $mod+Ctrl+h          split h; exec notify-send 'Horizontal Split Mode'
#bindsym $mod+Ctrl+v          split v; exec notify-send 'Vertical Split Mode'

# scratchpads
# move current window to a scratchpad
bindsym $mod+Shift+minus      move scratchpad
# show scratchpad
bindsym $mod+minus            scratchpad show

# workspaces
bindsym $mod+w                exec --no-startup-id rofi -show window -show-icons
# switch to workspace
bindsym $mod+1                workspace number $ws1
bindsym $mod+2                workspace number $ws2
bindsym $mod+3                workspace number $ws3
bindsym $mod+4                workspace number $ws4
bindsym $mod+5                workspace number $ws5
bindsym $mod+6                workspace number $ws6
bindsym $mod+7                workspace number $ws7
bindsym $mod+8                workspace number $ws8
bindsym $mod+9                workspace number $ws9
bindsym $mod+0                workspace number $ws10
# move focused container to workspace
bindsym $mod+Shift+1          move container to workspace number $ws1
bindsym $mod+Shift+2          move container to workspace number $ws2
bindsym $mod+Shift+3          move container to workspace number $ws3
bindsym $mod+Shift+4          move container to workspace number $ws4
bindsym $mod+Shift+5          move container to workspace number $ws5
bindsym $mod+Shift+6          move container to workspace number $ws6
bindsym $mod+Shift+7          move container to workspace number $ws7
bindsym $mod+Shift+8          move container to workspace number $ws8
bindsym $mod+Shift+9          move container to workspace number $ws9
bindsym $mod+Shift+0          move container to workspace number $ws10
# navigate next/prev workspace
bindsym $mod+Tab              workspace next
bindsym $mod+Shift+Tab        workspace prev
bindsym $mod+Ctrl+l           workspace next
bindsym $mod+Ctrl+h           workspace prev
bindsym $mod+Ctrl+Right       workspace next
bindsym $mod+Ctrl+Left        workspace prev

mode "resize" {
        bindsym h             resize shrink width 10 px or 10 ppt
        bindsym j             resize grow height 10 px or 10 ppt
        bindsym k             resize shrink height 10 px or 10 ppt
        bindsym l             resize grow width 10 px or 10 ppt

        bindsym Return        mode "default"
        bindsym Escape        mode "default"
        bindsym $mod+r        mode "default"
}

#set $mode_system             (l)ock (e)xit switch_(u)ser (s)uspend (h)ibernate (r)eboot (shift+s)hutdown
#bindsym $mod+Ctrl+Escape     mode "$mode_system"
#mode "$mode_system" {
#	bindsym l                  exec --no-startup-id betterlockscreen -l dimblur
#  bindsym e                  exec --no-startup-id i3exit logout, mode "default"
#  bindsym u                  exec --no-startup-id i3exit switch_user, mode "default"
#	bindsym s                  exec --no-startup-id i3-msg exit && exit
#	bindsym s                  exec betterlockscreen -s -l dimblur
#  bindsym h                  exec --no-startup-id i3exit hibernate, mode "default"
#	bindsym r                  exec --no-startup-id i3exit reboot, mode "default"
#	bindsym Shift+s            exec --no-startup-id i3exit shutdown, mode "default"

#	bindsym Escape             mode "default"
#	bindsym Return             mode "default"
#}
