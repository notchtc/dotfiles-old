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
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox' 
call plug#end()

" Some basic stuff
set nocompatible
set number relativenumber
set clipboard=unnamedplus

" Looks
set background=dark
set termguicolors

let g:gruvbox_italic=1
colorscheme gruvbox
hi Normal ctermbg=NONE guibg=NONE

set noshowmode

let g:lightline = {
			\ 'colorscheme': 'gruvbox',
			\}

" Don't place an comment when making an newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Remove trailing newlines
autocmd BufWritePre * %s/\n\+\%$//e 
" Keybindings
let mapleader = " "
" Save file and go to previous/next one.
noremap <leader>p :wN<CR>
noremap <leader>n :wn<CR>
