# I set variables in this file, it is sourced every time.

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
export EDITOR=nvim
export VISUAL="$EDITOR"
export PAGER=less
export WM=cwm

export FZF_DEFAULT_OPTS="-m --color '16,bg+:-1,border:0' --border sharp --preview-window sharp:wrap --layout=reverse-list --info inline"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

# Set path
typeset -U path
path+="$HOME/.local/bin:$GEM_HOME/bin:$XDG_CONFIG_HOME/emacs/bin:$LIBERICA_DIR/bin"
