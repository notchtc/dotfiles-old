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
set -x FZF_DEFAULT_OPTS -m --color "16,bg+:-1" --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline

# Disable greeting
set -U fish_greeting

# OTHER
# Colorscheme
set fish_color_normal white
set fish_color_command green
set fish_color_quote cyan
set fish_color_redirection blue
set fish_color_end green
set fish_color_error red
set fish_color_param cyan
set fish_color_selection brgray --bold --background=grey
set fish_color_search_match green --background=grey
set fish_color_history_current --bold
set fish_color_operator cyan
set fish_color_escape cyan
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_valid_path --underline
set fish_color_autosuggestion grey
set fish_color_user green
set fish_color_host white
set fish_color_cancel -r
set fish_pager_color_completion white
set fish_pager_color_description green
set fish_pager_color_prefix brgray --bold --underline
set fish_pager_color_progress white --background=cyan
set fish_color_match --background=brgreen
set fish_color_comment grey

# Aliases
alias bat="bat --theme gruvbox-dark $argv"
alias e="$EDITOR $argv"
alias se="sudo $EDITOR $argv"
alias ls="exa --icons $argv"
alias lsa="exa -a --icons $argv"
alias lsl="exa -l --git --icons $argv"
alias lsla="exa -a -l --git --icons $argv"
alias rm="trash-put $argv"
alias rme="trash-empty $argv"
alias rml="trash-list $argv"
alias rmr="trash-restore $argv"

# Vi mode
fish_vi_key_bindings
