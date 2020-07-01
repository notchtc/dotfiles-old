# Plugins
source $HOME/.config/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh

# Prompt
PS1="[%F{red}%n%F{yellow}@%F{cyan}%m %F{yellow}%~%F{reset}] %F{red}~%F{reset} "

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Exports
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export HISTFILE=$XDG_DATA_HOME/zsh/history
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
export GEM_HOME=$XDG_DATA_HOME/gem
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem

export EDITOR="nvim"
export BROWSER="chromium"

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto/jre

export LANG="en_US.utf8"

export NVM_DIR="$HOME/.config/nvm"

export PATH="$JAVA_HOME/bin:$ZSH_CONFIG_FILES:$HOME/.local/bin:/opt/:$PATH"

# Aliases
# Shorter apt commands
alias ainstall="sudo apt-get install"
alias aremove="sudo apt-get remove"
alias apurge="sudo apt-get purge"
alias aclean="sudo apt-get autoremove"
alias aupdate="sudo apt-get upgrade"
alias padd="sudo add-apt-repository"
alias pupdate="sudo apt-get update"
# Time saving
alias sudo="sudo "
alias e="$EDITOR"
alias filec="ls -A -l | grep -v ^l | wc -l"
alias ..="cd .."
# Git repositories
alias config="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias gdwm="git --git-dir=$HOME/.local/builds/git/dwm --work-tree=$HOME/.local/builds/dwm"
alias gdwb="git --git-dir=$HOME/.local/builds/git/dwmblocks --work-tree=$HOME/.local/builds/dwmblocks"
alias gst="git --git-dir=$HOME/.local/builds/git/st --work-tree=$HOME/.local/builds/st"
# Misc
alias ls="ls --color"
alias trsh="trash"
alias trshl="trash-list"
alias trshe="trash-empty"
