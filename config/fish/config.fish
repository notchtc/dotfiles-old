# Install fisher, if it isn't
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# EXPORTS{{{
# XDG
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_CONFIG_HOME "$HOME/.config"

# Clean ~/
set -x GEM_HOME "$XDG_DATA_HOME/gem"
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x INPUTRC "$XDG_CONFIG_HOME/readline/inputrc"
set -x LESSHISTFILE -

# Use these
set -x BROWSER librewolf
set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x PAGER less
set -x TERM alacritty

# Set path
contains $HOME/.local/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.local/bin

# Set fzf default options
set -x FZF_DEFAULT_OPTS -m --color "16" --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline
#}}}

# COLORS{{{
# Lucid prompt{{{
set -g lucid_cwd_color brcyan
set -g lucid_git_color cyan
#}}}

# Colorscheme{{{
set -g fish_color_normal white
set -g fish_color_command brgreen
set -g fish_color_quote cyan
set -g fish_color_redirection brcyan
set -g fish_color_end green
set -g fish_color_error brred
set -g fish_color_param brcyan
set -g fish_color_selection brgray --bold --background=grey
set -g fish_color_search_match brgreen --background=grey
set -g fish_color_history_current --bold
set -g fish_color_operator brcyan
set -g fish_color_escape brcyan
set -g fish_color_cwd brgreen
set -g fish_color_cwd_root red
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion grey
set -g fish_color_user brgreen
set -g fish_color_host white
set -g fish_color_cancel -r
set -g fish_pager_color_completion white
set -g fish_pager_color_description green
set -g fish_pager_color_prefix brgray --bold --underline
set -g fish_pager_color_progress white --background=cyan
set -g fish_color_match --background=brgreen
set -g fish_color_comment grey
#}}}
#}}}

# OTHER{{{
# Vi keybindings
fish_vi_key_bindings

# Disable greeting
set -U fish_greeting

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
#}}}

# vim: set foldmethod=marker:
