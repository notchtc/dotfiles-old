# EXPORTS
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
set -x BROWSER "firefox"
set -x EDITOR nvim
set -x VISUAL $EDITOR
set -x PAGER less
set -x TERM alacritty

# Make gpg work
set -x GPG_TTY (tty)

# Set path
fish_add_path $HOME/.local/bin
fish_add_path $GEM_HOME/bin

# Set fzf default options
set -x FZF_DEFAULT_OPTS -m --color "16" --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline

# Disable greeting
set -U fish_greeting

# OTHER
# Colorscheme
set fish_color_normal white
set fish_color_command brgreen
set fish_color_quote cyan
set fish_color_redirection brcyan
set fish_color_end green
set fish_color_error brred
set fish_color_param brcyan
set fish_color_selection brgray --bold --background=grey
set fish_color_search_match brgreen --background=grey
set fish_color_history_current --bold
set fish_color_operator brcyan
set fish_color_escape brcyan
set fish_color_cwd brgreen
set fish_color_cwd_root red
set fish_color_valid_path --underline
set fish_color_autosuggestion grey
set fish_color_user brgreen
set fish_color_host white
set fish_color_cancel -r
set fish_pager_color_completion white
set fish_pager_color_description green
set fish_pager_color_prefix brgray --bold --underline
set fish_pager_color_progress white --background=cyan
set fish_color_match --background=brgreen
set fish_color_comment grey

# Vi mode
fish_vi_key_bindings
