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
set SPICETIFY_INSTALL $HOME/stuff/misc/spicetify-cli
set QT_QPA_PLATFORMTHEME qt5ct

set fish_user_paths $PATH $HOME/.local/bin $HOME/.emacs.d/bin $SPICETIFY_INSTALL $HOME/.cabal/bin

# Abbreviations
# Launch editor
abbr --add e "$EDITOR"
abbr --add se "sudo $EDITOR"
# Apt
abbr --add ainstall "sudo apt-get install"
abbr --add aupdate "sudo apt-get upgrade"
abbr --add aremove "sudo apt-get remove"
abbr --add apurge "sudo apt-get purge"
abbr --add aclean "sudo apt-get autoremove"
abbr --add pupdate "sudo apt-get update"
abbr --add padd "sudo add-apt-repository"

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
