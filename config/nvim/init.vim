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
Plug 'dag/vim-fish'
Plug 'frazrepo/vim-rainbow'
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Some basic stuff
set nocompatible
set number relativenumber
set clipboard+=unnamedplus

" Looks
set background=dark
colorscheme dracula
hi Normal ctermbg=NONE
set noshowmode

let g:lightline = {
			\ 'colorscheme': 'dracula',
			\}

" Don't place an comment when making an newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Remove trailing newlines
autocmd BufWritePre * %s/\n\+\%$//e 
" Keybindings
" Save file and go to previous/next one.
noremap ;p :wN<CR>
noremap ;n :wn<CR>
" Format file
noremap <F3> :Autoformat<CR>:w<CR>

" Fish
if &shell =~# 'fish$'
	set shell=sh
endif
