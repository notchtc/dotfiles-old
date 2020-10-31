# Install zinit if it's not
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||           \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo (this is currently required for annexes)
zinit light-mode for         \
    zinit-zsh/z-a-rust       \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl   \
    zinit-zsh/z-a-bin-gem-node

# Plugins
zinit lucid light-mode for             \
    pick"async.zsh" src"pure.zsh"      \
        sindresorhus/pure              \
    wait zsh-users/zsh-autosuggestions \
    atload"zicompinit"                 \
        zdharma/fast-syntax-highlighting

# Exports
typeset -U PATH path # Discard duplicates from path
path=("$HOME/.local/bin" "$path[@]")
export PATH
export BROWSER=firefox
export EDITOR=nvim
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Aliases
alias e="$EDITOR"            # Get to that editor faster
alias se="sudo $EDITOR"      # Same thing, but with sudo
alias ..="cd .."             # Go to previous directory without typing cd
alias ls="ls --color=always" # Colors in ls

# Other
bindkey -v # Vim bindings
