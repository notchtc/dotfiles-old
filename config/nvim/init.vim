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
Plug '~/.config/nvim/plugins/selenized/' " https://github.com/jan-warchol/selenized/tree/master/editors/vim
call plug#end()

set nocompatible
set number relativenumber
set clipboard+=unnamedplus
" Don't @ me
setlocal foldmethod=indent

set background=dark
colorscheme selenized_bw
hi Normal ctermbg=NONE
set noshowmode

let g:lightline = {
			\ 'colorscheme': 'selenized_black',
			\}

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufWritePre * %s/\n\+\%$//e " Remove trailing newlines

autocmd BufWritePost *Xresources,*Xdefaults !xrdb % " Reload .Xresources/.Xdefaults on reload

" Save file and go to previous/next one.
noremap ;p :wN<CR>
noremap ;n :wn<CR>
" Format file
noremap <F3> :Autoformat<CR>:w<CR>

if &shell =~# 'fish$'
	set shell=sh
endif
