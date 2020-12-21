#!/usr/bin/env fish
# Install fisher, if it's not available
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# EXPORTS{{{
# XDG
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"

# Cleaning up the home directory
set -Ux GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -Ux INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set -Ux LESSHISTFILE -

# Use these you filthy application
set -Ux BROWSER firefox
set -Ux EDITOR nvim
set -Ux TERM alacritty

# Set path
contains $HOME/.local/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/bin

# Fzf default options
set -Ux FZF_DEFAULT_OPTS -m --color "16,border:#928374" --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline
#}}}

# OTHER{{{
# Vi bindings baby
fish_vi_key_bindings

# Disable fish greeting
set -U fish_greeting
#}}}

# COLORS{{{
# Lucid prompt{{{
set -g lucid_vi_insert_color "#83a598"
set -g lucid_vi_default_color "#928374"
set -g lucid_vi_visual_color "#fe8019"
set -g lucid_cwd_color "#8ec07c"
set -g lucid_git_color "#689d6a"
#}}}

# Colorscheme{{{
set -g fish_color_normal "#ebdbb2"
set -g fish_color_command "#b8bb26"
set -g fish_color_quote "#689d6a"
set -g fish_color_redirection "#8ec07c"
set -g fish_color_end "#98971a"
set -g fish_color_error "#fb4934"
set -g fish_color_param "#8ec07c"
set -g fish_color_selection "#a89984" --bold --background="#928374"
set -g fish_color_search_match "#b8bb26" --background="#928374"
set -g fish_color_history_current --bold
set -g fish_color_operator "#8ec07c"
set -g fish_color_escape "#8ec07c"
set -g fish_color_cwd "#b8bb26"
set -g fish_color_cwd_root "#cc241d"
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion "#928374"
set -g fish_color_user "#b8bb26"
set -g fish_color_host "#ebdbb2"
set -g fish_color_cancel -r
set -g fish_pager_color_completion "#ebdbb2"
set -g fish_pager_color_description "#98971a"
set -g fish_pager_color_prefix "#a89984" --bold --underline
set -g fish_pager_color_progress "#ebdbb2" --background="#689d6a"
set -g fish_color_match --background="#b8bb26"
set -g fish_color_comment "#928374"
#}}}
#}}}
# vim: set foldmethod=marker:
