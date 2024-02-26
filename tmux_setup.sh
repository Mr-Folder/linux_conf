sudo apt install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cat << 'EOF' > $HOME/.tmux.conf
set -g activity-action other
set -g assume-paste-time 1
set -g base-index 0
set -g bell-action any
set -g default-command ''
set -g default-shell /usr/bin/zsh
set -g default-size 80x24
set -g destroy-unattached off
set -g detach-on-destroy on
set -g display-panes-active-colour red
set -g display-panes-colour blue
set -g display-panes-time 1000
set -g display-time 750
set -g key-table root
set -g lock-after-time 0
set -g lock-command "lock -np"
set -g message-command-style bg=black,fg=yellow
set -g message-style bg=yellow,fg=black
set -g mouse on    # Changed from 'off' to 'on'
set -g prefix C-b
set -g prefix2 None
set -g renumber-windows off
set -g set-titles off
set -g set-titles-string "#S:#I:#W - \"#T\" #{session_alerts}"
set -g silence-action other
set -g status on
set -g status-bg default
set -g status-fg default
# ... [rest of your configuration] ...
set-option -g history-limit 10000
set-option -g repeat-time 1000
set-window-option -g mode-keys vi
 
 
# set pane borders to dark gray and active pane border to lime blue
set -g pane-border-style fg=colour238,bg=default
set -g pane-active-border-style fg=colour45,bg=default
 
# Set window status styles
set -g window-status-style fg=colour238,bg=default # Dark gray for inactive window titles
set -g window-status-current-style fg=colour45,bg=default # Lime blue for the active window title
 
# Set status bar to dark gray background with lime blue text
set -g status-style fg=colour45,bg=colour238
 
# Optional: Set the message text style for commands
set -g message-style fg=colour45,bg=colour238
 
# Optional: Set the command prompt style
set -g message-command-style fg=colour45,bg=colour238


# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'nhdaly/tmux-better-mouse-mode'

run '~/.tmux/plugins/tpm/tpm'
EOF

tmux source ~/.tmux.conf

