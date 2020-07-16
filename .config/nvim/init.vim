" Download vim-plug if you don't have it
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'dag/vim-fish'
Plug 'frazrepo/vim-rainbow'
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/lightline.vim'
Plug '~/.config/nvim/plugins/selenized/' " https://github.com/jan-warchol/selenized/tree/master/editors/vim
call plug#end()

" Basics
set nocompatible
set number relativenumber
set clipboard+=unnamedplus
" Don't @ me
setlocal foldmethod=indent
" Looks
set background=dark
colorscheme selenized_bw
hi Normal ctermbg=NONE
set noshowmode

let g:lightline = {
			\ 'colorscheme': 'selenized_black',
			\}

" Don't place an comment after making an comment and creating a newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Bufwrites
autocmd BufWritePre * %s/\s\+$//e " Remove trailing spaces
autocmd BufWritePre * %s/\n\+\%$//e " Remove trailing newlines

autocmd BufWritePost *Xresources,*Xdefaults !xrdb % " Reload .Xresources/.Xdefaults on reload

let g:autoformat_remove_trailing_spaces = 0

autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

" Keybinds
" Save file and go to previous/next one.
noremap ;p :wN<CR>
noremap ;n :wn<CR>
" Format file
noremap <F3> :Autoformat<CR>:w<CR>

" Other
" Set shell to sh if it's fish
if &shell =~# 'fish$'
	set shell=sh
endif
