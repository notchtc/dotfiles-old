# Config files
export DOTZSH=$HOME/.config/zsh
source $DOTZSH/.ea

# Plugins
source $DOTZSH/plugins/fsh/fast-syntax-highlighting.plugin.zsh

# Prompt
PS1="[%F{red}%n%F{yellow}@%F{cyan}%m %F{yellow}%~%F{reset}] %F{red}~%F{reset} "
