# Install fisher, if it's not available
if not functions -q fisher
	set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
	curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
	fish -c fisher
end

## EXPORTS ##
# XDG
set XDG_DATA_HOME "$HOME/.local/share"
set XDG_CONFIG_HOME "$HOME/.config"
set XDG_CACHE_HOME "$HOME/.cache"
set XDG_DESKTOP_DIR "$HOME/stuff/desktop"
set XDG_DOWNLOAD_DIR "$HOME/stuff/downloads"
set XDG_TEMPLATES_DIR "$HOME/stuff/misc"
set XDG_PUBLICSHARE_DIR "$HOME/stuff/pshare"
set XDG_DOCUMENTS_DIR "$HOME/stuff/docs"
set XDG_MUSIC_DIR "$HOME/stuff/music"
set XDG_PICTURES_DIR "$HOME/stuff/images"
set XDG_VIDEOS_DIR "$HOME/stuff/videos"
# Cleaning up the home directory
set INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set LESSHISTFILE "$XDG_CACHE_HOME/.lesshist"

# Use these you filthy application
set EDITOR "nvim"
set BROWSER "firefox"

# Other
set -U SXHKD_SHELL "sh"
set fish_user_paths "$PATH" "$HOME/.local/bin $HOME/.local/bin/bb"

## OTHER ##
# Vi bindings baby
fish_vi_key_bindings

# Disable fish greeting
set -U fish_greeting
