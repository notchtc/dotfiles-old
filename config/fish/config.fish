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

set fish_user_paths $PATH $HOME/.local/bin $HOME/.emacs.d/bin $SPICETIFY_INSTALL $HOME/.cabal/bin

# Abbreviations
# XBPS
abbr --add xi "sudo xbps-install -S"
abbr --add xup "sudo xbps-install -Su"
abbr --add xr "sudo xbps-remove -R"
abbr --add xrs "xbps-query -Rs"


# Launch editor
abbr --add e "$EDITOR"
abbr --add se "sudo $EDITOR"

# Vi bindings baby
fish_vi_key_bindings

# Start X at login
if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end

# Other
set -U fish_greeting
# Stupid Rice Shit
#neofetch
