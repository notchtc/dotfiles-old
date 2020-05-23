# Path of ZSH config files
export DOTZSH=$HOME/.config/zsh

source $DOTZSH/.ea

# Normal Prompt
#PS1="[%F{red}%n%F{yellow}@%F{cyan}%m %F{yellow}%~%F{reset}] %F{red}~%F{reset} "

source ~/.config/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/spaceship/spaceship.zsh

bindkey -v

