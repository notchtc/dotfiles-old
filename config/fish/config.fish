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
set EDITOR "emacs"
set BROWSER "firefox"

# Other
set SPICETIFY_INSTALL /home/cha0t1c/spicetify-cli
set QT_QPA_PLATFORMTHEME qt5ct

set fish_user_paths $PATH $HOME/.local/bin $HOME/.emacs.d/bin $SPICETIFY_INSTALL

# Variables for bobthefish theme
source ~/.config/fish/bobthe.fish

# Vi bindings baby
fish_vi_key_bindings

# Abbreviations
abbr --add e "$EDITOR"
abbr --add se "sudo $EDITOR"

# Start X at login
if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end

# Other
set -U fish_greeting
# Stupid Rice Shit
neofetch
