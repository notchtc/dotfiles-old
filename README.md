# Cha0t1c's Dotfiles
This repo is used for keeping my own dotfiles and so you can use them too if You want.

## Screenshots
![Terminal on Startup](https://cha0t1c-is-a.living-me.me/i/dvxt.png)
![Terminal in Neovim](https://cha0t1c-is-a.living-me.me/i/0do4.png)
![Nerdtree in Neovim](https://cha0t1c-is-a.living-me.me/i/1hfn.png)

## Things you need
(to use every dotfile)
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
   - [vim-plug](https://github.com/junegunn/vim-plug)  (The neovim config file downloads this automatically)

And I think that's all You need, also be ready to use vim keybindings in the terminal or just remove the zsh-vim-mode plugin.

Note: I assume that you know something about ~~GNU/Linux, or as I've recently taken to calling it, GNU plus Linux~~ Linux.
I recommend using the things mentioned in [Things you need](#things-you-need)

### It contains some useful aliases!
- apt-[something] (If You don't use a debian based distro this will be useless, so just delete them or change the name and command)
   - apt-install
   - apt-remove
   - apt-clean (Does autoremove)
   - apt-update (Updates everything)
- ppa-add and ppa-update (Again, you might want to change the name and command if you don't use a Debian based distro or just delete them)
- filec (Counts all the files in a directory except **.**, **..** and **symlinks**)
- e (Opens the neovim or something different if you changed it in the .ea file)
- src (basically source but shorter)