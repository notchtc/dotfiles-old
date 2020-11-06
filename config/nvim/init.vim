" Plugins
" Download Plugin Manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'ianchanning/vim-selenized'
call plug#end()

" Some basic stuff
syntax enable
set nocompatible
set number relativenumber
set clipboard=unnamedplus

" Looks
set termguicolors
colorscheme selenized
set background=dark
set noshowmode
hi Normal ctermbg=NONE guibg=NONE

let g:lightline = {
      \ 'colorscheme': 'selenized_dark'
      \ }


" Don't place an comment when making an newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Remove trailing newlines
autocmd BufWritePre * %s/\n\+\%$//e 
" Keybindings
let mapleader = " "
" Save file and go to previous/next one.
noremap <leader>p :wN<CR>
noremap <leader>n :wn<CR>
