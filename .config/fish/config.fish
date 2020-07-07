if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Exports
set XDG_DATA_HOME $HOME/.local/share
set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set EDITOR "nvim"
set BROWSER "chromium"
set -U fish_user_paths $fish_user_paths $HOME/.local/bin /opt/

fish_vi_key_bindings

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        # use this one if you don't want to place your .xinitrc somewhere else
	# exec startx -- -keeptty
	exec startx "~/.config/X11/.xinitrc" -- -keeptty
    end
end
