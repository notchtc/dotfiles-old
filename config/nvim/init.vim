" If shell is fish change it to sh
if &shell =~# 'fish$'
    set shell=sh
endif

"" PLUGINS ""
" Download Plugin Manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')
Plug 'dag/vim-fish'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
call plug#end()

"" MAKE YOUR LIFE BETTER ""
set relativenumber number
set clipboard=unnamedplus

" Don't place an comment when making an newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Reload some configs after editing them
autocmd BufWritePost init.vim source %
autocmd BufWritePost Xresources !xrdb -merge % 

set updatetime=100

"" LOOKS ""
set termguicolors
colorscheme gruvbox
set background=dark
set noshowmode
hi Normal ctermbg=NONE guibg=NONE

"" PLUGIN CONFIG ""
" fish
autocmd FileType fish compiler fish

" gitgutter
hi! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 1

" indentline
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox'
      \ }
