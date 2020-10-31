# Install zinit if it's not
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# Plugins
zinit lucid light-mode for \
    pick"async.zsh" src"pure.zsh" \
        sindresorhus/pure \
    wait zsh-users/zsh-autosuggestions \
    atload"zicompinit" \
        zdharma/fast-syntax-highlighting

# Vim bindings
bindkey -v

# Aliases
# Get to that editor faster
alias e="$EDITOR"
alias se="sudo $EDITOR"
# Go to previous directory without typing cd
alias ..="cd .."
alias ls="ls --color=always"

# Path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")

# Applications
BROWSER=firefox
EDITOR=nvim

# Exports
export PATH
export BROWSER
export EDITOR
