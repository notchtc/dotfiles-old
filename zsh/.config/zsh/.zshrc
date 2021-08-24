autoload colors && colors
autoload -Uz compinit

#
# EXPORTS
#

HISTFILE="$XDG_CONFIG_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# prompt
PS1="%F{cyan}%~ %(?.%F{green}.%F{red})>%F{normal} "

#
# ALIASES
#

# editor
alias e="$EDITOR"
alias se="doas $EDITOR"

# ls
alias ls="exa --icons --group-directories-first"
alias lsa="exa -a --icons --group-directories-first"
alias lsl="exa -a -l --git --icons --group-directories-first"
alias lsla="exa -a -l --git --icons --group-directories-first"

# trash
alias rm="trash-put"
alias rme="trash-empty"
alias rml="trash-list"
alias rmr="trash-restore"

# xbps
alias xi="doas xbps-install -S"
xif() {
    xbps-query -Rs . --regex | cut -d " " -f 2 | fzf -q "$1" --preview "xbps-query -RS {1}" | xargs -ro doas xbps-install -S
}
alias xr="doas xbps-remove -R"
xrf() {
    xbps-query -l | cut -d " " -f 2 | fzf -q "$1" --preview "xbps-query -S {1}" |  xargs -ro doas xbps-remove -R
}
alias xu="doas xbps-install -Su"
alias xc="doas xbps-remove -Oo"

# other
adf() {
    asciidoctor-pdf -o - $1 | zathura -
}
alias bat="bat --theme ansi"
setwal() {
    cp $1 "$XDG_CONFIG_HOME/awesome/wall.png"
}
smn() {
    apropos . | cut -d "(" -f 1 | cut -d "," -f 1 | fzf --multi -q "$1" --preview "man {1}" | xargs -ro man
}

#
# COMPLETION
#

zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#
# VI
#

# Enable Vi keybindings
bindkey -v

# Use vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Vi cursor
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

#
# PLUGINS
#

# Autosuggestions
source "$XDG_CONFIG_HOME/zsh/asg/zsh-autosuggestions.zsh"

# Syntax highlighting
source "$XDG_CONFIG_HOME/zsh/fsh/fast-syntax-highlighting.plugin.zsh"

#
# MISC
#

# Enter directory by just typing path
setopt autocd autopushd
