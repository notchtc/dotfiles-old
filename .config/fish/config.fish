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
        exec startx "/home/cha0t1c/.config/X11/.xinitrc" -- -keeptty
    end
end
