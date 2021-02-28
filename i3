set $mod Mod4
floating_modifier $mod

# decoration
font pango:Cantarell 11
hide_edge_borders both
default_border pixel
default_floating_border normal
bindsym $mod+b border toggle

# background
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec_always --no-startup-id ~/.fehbg
exec_always --no-startup-id setxkbmap -option caps:escape
exec --no-startup-id unclutter
exec_always --no-startup-id alttab -font xft:Hack:pixelsize=15:antialias=true:autohint=true
exec_always --no-startup-id xss-lock -- i3lock -n -e -c 000000
exec --no-startup-id keepassxc

# quick actions
bindsym $mod+Return exec --no-startup-id st
bindsym $mod+space exec --no-startup-id rofi -show combi
bindsym $mod+Ctrl+space exec --no-startup-id rofi -show window
bindsym $mod+Shift+space exec --no-startup-id rofi -show run
bindsym $mod+a [urgent=latest] focus
bindsym $mod+q kill

# system commands
set $mode_system system: (l) lock, (L) logout, (s) shutdown, (S) reboot, (r) reload, (R) restart
mode "$mode_system" {
  bindsym l exec --no-startup-id loginctl lock-session, mode "default"
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

bindsym $mod+w layout toggle tabbed stacking
bindsym $mod+e layout toggle split
bindsym $mod+t split toggle

bindsym $mod+f fullscreen toggle
bindsym $mod+Ctrl+f fullscreen toggle global
bindsym $mod+Shift+f floating toggle
bindsym $mod+Shift+s sticky toggle

# resize

bindsym $mod+z gaps inner current plus 5
bindsym $mod+Shift+z gaps inner current minus 5
bindsym $mod+Ctrl+Shift+z gaps inner current set 0

bindsym $mod+x gaps outer current plus 5
bindsym $mod+Shift+x gaps outer current minus 5
bindsym $mod+Ctrl+Shift+x gaps outer current set 0

bindsym $mod+y resize grow left 5 px or 1 ppt
bindsym $mod+u resize grow down 5 px or 1 ppt
bindsym $mod+i resize grow up 5 px or 1 ppt
bindsym $mod+o resize grow right 5 px or 1 ppt

bindsym $mod+Shift+y resize shrink left 5 px or 1 ppt
bindsym $mod+Shift+u resize shrink down 5 px or 1 ppt
bindsym $mod+Shift+i resize shrink up 5 px or 1 ppt
bindsym $mod+Shift+o resize shrink right 5 px or 1 ppt

# focus

focus_on_window_activation urgent
focus_wrapping no

bindsym $mod+g focus mode_toggle

bindsym $mod+m focus parent
bindsym $mod+n focus child

bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

bindsym $mod+Prior workspace prev_on_output
bindsym $mod+Next workspace next_on_output
bindsym $mod+Ctrl+Left workspace prev_on_output
bindsym $mod+Ctrl+Right workspace next_on_output

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

# movement

workspace_auto_back_and_forth yes

bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

bindsym $mod+Ctrl+h move to output left
bindsym $mod+Ctrl+j move to output down
bindsym $mod+Ctrl+k move to output up
bindsym $mod+Ctrl+l move to output right

bindsym $mod+Ctrl+Shift+h move workspace to output left
bindsym $mod+Ctrl+Shift+j move workspace to output down
bindsym $mod+Ctrl+Shift+k move workspace to output up
bindsym $mod+Ctrl+Shift+l move workspace to output right

bindsym $mod+Shift+Prior move to workspace prev
bindsym $mod+Shift+Next move to workspace next
bindsym $mod+Tab workspace back_and_forth

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

# mark

bindsym $mod+c mark mark
bindsym $mod+Shift+c unmark mark
bindsym $mod+v [con_mark=mark] focus
bindsym $mod+Shift+v swap container with mark mark

# overrides

for_window [class="Blueman-manager"] floating enable
for_window [class="Gnome-calculator"] floating enable
for_window [class="KeePassXC"] floating enable
for_window [class="Pavucontrol"] floating enable
for_window [title="Remmina Remote Desktop Client"] floating enable
for_window [class="Vivi"] floating enable
