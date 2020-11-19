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
set GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set LESSHISTFILE "$XDG_CACHE_HOME/.lesshist"

# Use these you filthy application
set EDITOR "nvim"
set BROWSER "firefox"

# Other
set -U SXHKD_SHELL "sh"
set fish_user_paths "$PATH" "$HOME/.local/bin"

## OTHER ##
# Vi bindings baby
fish_vi_key_bindings

# Pure prompt
set pure_color_success bryellow
set pure_color_danger brmagenta
set pure_color_primary brcyan
set pure_color_mute grey

# Colorscheme
set -g fish_color_normal normal
set -g fish_color_command bryellow
set -g fish_color_quote blue
set -g fish_color_redirection brblue
set -g fish_color_end blue
set -g fish_color_error brmagenta
set -g fish_color_param cyan
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_history_current --bold
set -g fish_color_operator brcyan
set -g fish_color_escape brcyan
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion brblack
set -g fish_color_user bryellow
set -g fish_color_host normal
set -g fish_color_cancel -r
set -g fish_pager_color_completion normal
set -g fish_pager_color_description yellow
set -g fish_pager_color_prefix white --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_color_match --background=brblue
set -g fish_color_comment grey

# Disable fish greeting
set -U fish_greeting
