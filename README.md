# Cha0t1c's Dotfiles
This repo is used for keeping my own dotfiles and so you can use them too if You want.\
[Screenshots](#screenshots) are at the bottom
## Things you need to use every dotfile
- Rxvt-unicode
- zsh
   - [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
      - [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
         - The [MesloLGS NF](https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k) font
      - [zsh-vim-mode](https://github.com/softmoth/zsh-vim-mode)
      - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   - [ufetch](https://gitlab.com/jschx/ufetch) (Preferably installed in **~/.local/bin** under the name **ufetch.sh**, so that you don't need to change the .zshrc file)
- xdotool (To enter normal vim-mode on startup)
- Neovim (to use the neovim config file, obviously)
   - [vim-plug](https://github.com/junegunn/vim-plug)  (The Neovim config file downloads this automatically)

Note: I assume that you know something about ~~GNU/Linux, or as I've recently taken to calling it, GNU plus~~ Linux.
I highly recommend using the things mentioned in [Things you need](#things-you-need), unless you want to do some editing.
### Useful aliases
- apt aliases (If you aren't using a Debian based distro, just delete them or change their commands and names)
   - apt-install (Installs packages, obviously)
   - apt-remove (Uninstalls packages)
   - apt-clean (Does autoremove)
   - apt-update (Updates everything)
   - ppa-add (Adds ppa's)
   - ppa-update (Updates them)
- filec (Counts all the files in a directory except **.**, **..** and **symlinks**)
- e (Opens Neovim or something different if you changed it in the .ea file)
- src (Basically source but shorter)
## Screenshots
![Terminal on Startup](https://cha0t1c-is-a.living-me.me/i/e3bq.png)
(To make ufetch look like on the screenshot remove ${bold} from the color variables and replace the current colors in ${insert_name_of_color} to cyan)
![Terminal in Neovim](https://cha0t1c-is-a.living-me.me/i/0yl8.png)
![Nerdtree in Neovim](https://cha0t1c-is-a.living-me.me/i/24ot.png)