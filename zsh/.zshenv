# Set some XDG stuff
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Set zsh config directory
export ZDOTDIR=${ZDOTDIR:="$XDG_CONFIG_HOME/zsh"}

# Clean up ~/
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export GEM_PATH="$XDG_DATA_HOME/gem"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export EMACSDIR="$XDG_CONFIG_HOME/emacs"
export DOOMDIR="$XDG_CONFIG_HOME/doom"
export DOOMLOCALDIR="$DOOMDIR/local"
export LESSHISTFILE=-

# Default apps
export BROWSER=firefox
export EDITOR=emacs
export VISUAL="$EDITOR"
export PAGER=less
export WM=awesome

export FZF_DEFAULT_OPTS="-m --color '16,bg+:-1,border:8' --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline"

export LIBERICA_DIR="$HOME/.local/bin/jdk8u292-full"

# Set path
typeset -U path
path+="$HOME/.local/bin:$GEM_HOME/bin:$XDG_CONFIG_HOME/emacs/bin"