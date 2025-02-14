# default apps
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="ghostty"
export BROWSER="zen-browser"

# default folders
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"

# adds ~/.local/bin and subfolders to $PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set the localization
export LC_ALL=en_US.UTF-8
