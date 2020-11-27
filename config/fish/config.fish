#!/usr/bin/env fish
# Install fisher, if it's not available
if not functions -q fisher
	set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
	curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
	fish -c fisher
end

set dirs "$HOME/.cache" "$HOME/.config" "$HOME/.local/share" "$HOME/stuff/desktop" "$HOME/stuff/docs" "$HOME/stuff/downloads" "$HOME/stuff/images" "$HOME/stuff/misc" "$HOME/stuff/music" "$HOME/stuff/videos"
for i in $dirs
	if not test -d $i
		mkdir $i
	end
end

## EXPORTS ##
# XDG
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_DESKTOP_DIR "$HOME/stuff/desktop"
set -Ux XDG_DOCUMENTS_DIR "$HOME/stuff/docs"
set -Ux XDG_DOWNLOAD_DIR "$HOME/stuff/downloads"
set -Ux XDG_MUSIC_DIR "$HOME/stuff/music"
set -Ux XDG_PICTURES_DIR "$HOME/stuff/images"
set -Ux XDG_TEMPLATES_DIR "$HOME/stuff/misc"
set -Ux XDG_VIDEOS_DIR "$HOME/stuff/videos"
# Cleaning up the home directory
set -Ux GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -Ux INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set -Ux LESSHISTFILE -

# Use these you filthy application
set -Ux BROWSER firefox
set -Ux EDITOR nvim
set -Ux TERM alacritty

# Other
set -Ux SXHKD_SHELL sh
set -Ux fish_user_paths "$PATH" "$HOME/.local/bin" "$HOME/.cabal/bin"

## OTHER ##
# Vi bindings baby
fish_vi_key_bindings

# Pure prompt
set -g pure_color_success brgreen
set -g pure_color_danger bryellow
set -g pure_color_primary brcyan
set -g pure_color_mute grey

# Colorscheme
set -g fish_color_normal normal
set -g fish_color_command brgreen
set -g fish_color_quote blue
set -g fish_color_redirection brblue
set -g fish_color_end blue
set -g fish_color_error bryellow
set -g fish_color_param cyan
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match brgreen --background=brblack
set -g fish_color_history_current --bold
set -g fish_color_operator brcyan
set -g fish_color_escape brcyan
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion brblack
set -g fish_color_user brgreen
set -g fish_color_host normal
set -g fish_color_cancel -r
set -g fish_pager_color_completion normal
set -g fish_pager_color_description green
set -g fish_pager_color_prefix white --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_color_match --background=brblue
set -g fish_color_comment grey

# Disable fish greeting
set -U fish_greeting
