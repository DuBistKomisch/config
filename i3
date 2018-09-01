set $mod Mod4
floating_modifier $mod

# decoration
font pango:Cantarell 11
hide_edge_borders both

# background
exec --no-startup-id compton --config ~/.config/compton.conf -d :0 -b
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec_always --no-startup-id ~/.fehbg
exec_always --no-startup-id setxkbmap -option caps:escape
exec --no-startup-id unclutter

# quick actions
bindsym $mod+Return exec --no-startup-id st
bindsym $mod+space exec --no-startup-id j4-dmenu-desktop
bindsym $mod+x [urgent=latest] focus
bindsym $mod+q kill

# system commands
set $mode_system system: (l) lock, (L) logout, (s) shutdown, (S) reboot, (r) reload, (R) restart
mode "$mode_system" {
  bindsym l exec --no-startup-id i3lock -e -c 000000, mode "default"
  bindsym Shift+l exec --no-startup-id i3-msg exit, mode "default"
  bindsym s exec --no-startup-id systemctl poweroff -i, mode "default"
  bindsym Shift+s exec --no-startup-id systemctl reboot, mode "default"
  bindsym r reload, mode "default"
  bindsym Shift+r restart, mode "default"

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+Delete mode "$mode_system"

# screenshot commands
set $mode_screenshot screenshot: (f) full, (w) window, (a) area, (shift) clipboard
mode "$mode_screenshot" {
  bindsym f exec maim > ~/screenshots/$(date +%Y%m%d_%H%M%S).png, mode "default"
  bindsym Shift+f exec maim | xclip -selection clipboard -t image/png, mode "default"
  bindsym w exec maim -i $(xdotool getactivewindow) > ~/screenshots/$(date +%Y%m%d_%H%M%S).png, mode "default"
  bindsym Shift+w exec maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png, mode "default"
  bindsym a exec maim -s > ~/screenshots/$(date +%Y%m%d_%H%M%S).png, mode "default"
  bindsym Shift+a exec maim -s | xclip -selection clipboard -t image/png, mode "default"

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+Print mode "$mode_screenshot"

# layout

bindsym $mod+t split toggle

bindsym $mod+f fullscreen toggle

bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# focus/movement

bindsym $mod+Shift+f floating toggle
#bindsym $mod+space focus mode_toggle

bindsym $mod+o focus parent
bindsym $mod+i focus child

bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

bindsym $mod+Ctrl+Shift+h move workspace to output left
bindsym $mod+Ctrl+Shift+j move workspace to output down
bindsym $mod+Ctrl+Shift+k move workspace to output up
bindsym $mod+Ctrl+Shift+l move workspace to output right

bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# resize
set $mode_resize resize: (<) shrink width, (>) grow width, (v) shrink height, (^) grow height
mode "$mode_resize" {
  bindsym h resize shrink width 10 px or 10 ppt
  bindsym j resize grow height 10 px or 10 ppt
  bindsym k resize shrink height 10 px or 10 ppt
  bindsym l resize grow width 10 px or 10 ppt
  bindsym Shift+h resize shrink width 100 px or 100 ppt
  bindsym Shift+j resize grow height 100 px or 100 ppt
  bindsym Shift+k resize shrink height 100 px or 100 ppt
  bindsym Shift+l resize grow width 100 px or 100 ppt
  bindsym $mod+h resize shrink width 1 px or 1 ppt
  bindsym $mod+j resize grow height 1 px or 1 ppt
  bindsym $mod+k resize shrink height 1 px or 1 ppt
  bindsym $mod+l resize grow width 1 px or 1 ppt

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+r mode "$mode_resize"
