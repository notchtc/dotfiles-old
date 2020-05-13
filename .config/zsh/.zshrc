# Path of ZSH config files
export DOTZSH=$HOME/.config/zsh

source $DOTZSH/.ea

### Added by Zinit's installer
if [[ ! -f $HOME/.local/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/.zinit" && command chmod g-rwX "$HOME/.local/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.local/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.local/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Plugins
zinit ice wait'!0'
zinit light sindresorhus/pure

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit light zdharma/fast-syntax-highlighting

pfetch

bindkey -v

