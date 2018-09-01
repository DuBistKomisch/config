# rebind to match screen
set-option -g prefix C-a
unbind-key C-b
bind-key C-a last-window
bind-key a send-prefix

# use vim keys for pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

set-option -g default-terminal 'tmux-256color'
set-option -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
set-option -g status-keys vi
set-option -g bell-action any
set-option -g set-titles on
set-option -g set-titles-string '#H:#S.#I.#P #W #T' # window number,program name,active (or not)
set-option -g visual-bell off

setw -g mode-keys vi
setw -g monitor-activity on

set-option -g status-justify left
set-option -g status-style bg=black,fg=white
set-option -g status-left-length 40
set-option -g status-right-length 80

set-option -g pane-active-border-style fg=green,bg=black
set-option -g pane-border-style fg=white,bg=black

set-option -g message-style fg=black,bg=green

setw -g window-status-style bg=black
setw -g window-status-current-style fg=green
setw -g window-status-bell-style fg=red,default
#setw -g window-status-content-style fg=yellow,default
setw -g window-status-activity-style fg=yellow,default

set -g status-left '#[fg=red]#H#[fg=yellow]:#[fg=white]#S #[fg=yellow]|#[default] '
set -g status-interval 15
set -g status-right ''

set -g history-limit 10000
