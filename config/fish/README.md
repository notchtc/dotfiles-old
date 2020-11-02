# [fish](https://fishshell.com)
My personal fish config that doesn't look too crazy and doesn't have thousands of things.

[[_TOC_]]

## Screenshot
![fish shell](../../images/fish.png)

## Aliases
|Alias|What it does                      |
|-----|----------------------------------|
|xi   |Install package with xbps         |
|xup  |Update packages with xbps         |
|xr   |Remove package with xbps          |
|xrs  |Search the xbps repository        |
|e    |Launch editor (nvim)[^1]          |
|se   |Launch editor with sudo (nvim)[^1]|

## Other
- Adds $HOME/.local/bin to PATH
- Vi keybindings
- Disable fish greeting
- Cleaning up the home directory
  - XDG
    - Sets XDG\_DATA\_HOME to $HOME/.local/share
    - Sets XDG\_CONFIG\_HOME to $HOME/.config
    - Sets XDG\_CACHE\_HOME to $HOME/.cache
    - Sets XDG\_DESKTOP\_DIR to $HOME/stuff/desktop
    - Sets XDG\_TEMPLATES\_DIR to $HOME/stuff/misc
    - Sets XDG\_PUBLICSHARE\_DIR to $HOME/stuff/pshare
    - Sets XDG\_DOCUMENTS\_DIR to $HOME/stuff/docs
    - Sets XDG\_MUSIC\_DIR to $HOME/stuff/music
    - Sets XDG\_PICTURES\_DIR to $HOME/stuff/images
    - Sets XDG\_VIDEOS\_DIR to $HOME/stuff/videos
  - Moves inputrc to $XDG\_CONFIG\_HOME/readline/input
  - Makes lesshist not appear
- Applications
  - Sets BROWSER to firefox[^1]
  - Sets EDITOR to nvim[^1]
  - Sets SXHKD\_SHELL to sh[^1]
[^1]: You can change this easily