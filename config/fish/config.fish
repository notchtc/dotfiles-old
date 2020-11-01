# Install fisher, if it's not available
if not functions -q fisher
	set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
	curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
	fish -c fisher
end

# Exports
# XDG
set XDG_DATA_HOME $HOME/.local/share
set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache

# Use these you filthy application
set EDITOR "nvim"
set BROWSER "firefox"

# Other
set SPICETIFY_INSTALL $HOME/stuff/misc/spicetify-cli
set QT_QPA_PLATFORMTHEME qt5ct
set -U SXHKD_SHELL sh

set fish_user_paths $PATH $HOME/.local/bin

# Aliases
# XBPS
alias xi="sudo xbps-install -S"
alias xup="sudo xbps-install -Su"
alias xr="sudo xbps-remove -R"
alias xrs="xbps-query -Rs"

# Launch editor
alias e="$EDITOR"
alias se="sudo $EDITOR"

# Vi bindings baby
fish_vi_key_bindings

# Other
set -U fish_greeting
