# Completion styling
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color ${realpath}'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color ${realpath}'
