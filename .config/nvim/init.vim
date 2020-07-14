if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')
Plug 'Chiel92/vim-autoformat'
Plug 'dag/vim-fish'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug '~/.config/nvim/plugins/selenized/' " https://github.com/jan-warchol/selenized/tree/master/editors/vim
call plug#end()

set nocompatible
set number relativenumber
set clipboard+=unnamedplus
set foldmethod=indent

set background=dark
colorscheme selenized_bw
hi Normal ctermbg=NONE
set noshowmode

let g:lightline = {
			\ 'colorscheme': 'selenized_black',
			\}

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

autocmd BufWritePost config.h,config.def.h,blocks.h !sudo make clean install
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

noremap <F3> :Autoformat<CR>:w<CR>
let g:autoformat_remove_trailing_spaces = 0

autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

" Keybinds
noremap ;n :wn<CR>
noremap ;p :wN<CR>

if &shell =~# 'fish$'
	set shell=sh
endif
