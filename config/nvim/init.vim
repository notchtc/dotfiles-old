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
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dag/vim-fish'
call plug#end()

"" MAKE YOUR LIFE BETTER ""
set relativenumber number
set clipboard=unnamedplus

" Disable commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Reload some configs after editing them
autocmd BufWritePost init.vim source %
autocmd BufWritePost Xresources !xrdb -merge % 

" Spaces > tabs
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4

" Keybindings
" Set the leader key
let mapleader = " "

" Make navigating through splits easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Make splits easier
map <leader>sv :split<CR>
map <leader>sh :vsplit<CR>

" Go to next file
nnoremap <leader>n :wn<CR>

" Go to previous file
nnoremap <leader>p :wN<CR>

" Open fzf
nnoremap <leader>ff :FZF<CR>

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
