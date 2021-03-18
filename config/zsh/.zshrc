autoload colors && colors
autoload -Uz compinit

# EXPORTS {{{
HISTFILE="$XDG_CONFIG_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

# XDG {{{
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
# }}}

# Clean ~/ {{{
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LESSHISTFILE=-
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
# }}}

# Use these {{{
export BROWSER=firefox
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export TERM=alacritty
export FZF_DEFAULT_OPTS="-m --color '16,bg+:-1' --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline"
# }}}

# Make gpg work
export GPG_TTY=$(tty)

# Prompt
export PS1="%{$fg[cyan]%~%} %{%(#~$fg[red]~$fg[green])%}>%{$fg[default]%} "

# Set path
path+="$HOME/.local/bin:$GEM_HOME/bin"
typeset -U path
# }}}

# ALIASES {{{
# editor {{{
alias e="$EDITOR"
alias se="sudo $EDITOR"
#}}}

# ls {{{
alias ls="exa --icons"
alias lsa="exa -a --icons"
alias lsl="exa -a -l --git --icons"
alias lsla="exa -a -l --git --icons"
# }}}

# trash {{{
alias rm="trash-put"
alias rme="trash-empty"
alias rml="trash-list"
alias rmr="trash-restore"
# }}}

# xbps {{{
alias xi="sudo xbps-install -S"
xif() {
    xbps-query -Rs . --regex | cut -d " " -f 2 | fzf -q "$1" --preview "xbps-query -RS {1}" | xargs -ro sudo xbps-install -S
}
alias xr="sudo xbps-remove -R"
xrf() {
    xbps-query -l | cut -d " " -f 1,2 | fzf -q "$1" --preview "xbps-query -RS {2}" | cut -d " " -f 2 | xargs -ro sudo xbps-remove -R
}
alias xu="sudo xbps-install -Su"
alias xc="sudo xbps-remove -Oo"
# }}}

# other {{{
adf() {
    asciidoctor-pdf -o - $1 | zathura -
}
alias bat="bat --theme ansi"
setwal() {
    cp $1 "$XDG_CACHE_HOME/wall.png"
}
smn() {
    apropos . | cut -d "(" -f 1 | cut -d "," -f 1 | fzf --multi -q "$1" --preview "man {1}" | xargs -ro man
}
# }}}
# }}}

# OTHER {{{
# Completion {{{
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# }}}

# Vim keys {{{
bindkey -v

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# }}}

# Vi cursor {{{
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'                # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# }}}

# Cd into directory just by typing the name
setopt autocd
# }}}

# PLUGINS {{{
# Autosuggestions
source "$XDG_CONFIG_HOME/zsh/asg/zsh-autosuggestions.zsh"

# Syntax highlighting
source "$XDG_CONFIG_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh"
# }}}

# vim: set foldmethod=marker:
