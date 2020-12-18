" If shell is fish change it to sh
if &shell =~# 'fish$'
    set shell=sh
endif

" PLUGINS{{{
" Download Plugin Manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " You need to install go
Plug 'Dimercel/todo-vim'
Plug 'dag/vim-fish'
call plug#end()"}}}

" SETTINGS{{{
" Use system clipboard
set clipboard=unnamedplus

" Fancy line numbers
set relativenumber number

" Imagine being casesensitive
set ignorecase
" Be case sensitive when pattern is uppercase
set smartcase

" Better splitting
set splitbelow splitright

" Add an cursor line
set cursorline

" Spaces > tabs
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4

" Show trailing spaces
set listchars=trail:·
set list

" Be able to see vim keybindings in awesome when using an alias
set title"}}}

" AUTOCMD{{{
" Remove trailing whitespace and newlines when saving
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"}}}

" LOOKS{{{
colorscheme gruvbox
set termguicolors
set background=dark
set noshowmode
hi Normal ctermbg=NONE guibg=NONE"}}}

" PLUGIN CONFIG{{{
" fish{{{
" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Enable folding of block structures in fish.
autocmd FileType fish set foldmethod=expr
"}}}

" gitgutter{{{
" Make GitGutter fit in
hi! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 1

" Make gitgutter update faster
set updatetime=100"}}}

" hexokinase{{{
let g:Hexokinase_highlighters = ['virtual']"}}}

" indentline{{{
" Set color to tab indent color
let g:indentLine_defaultGroup = 'SpecialKey'

" Set characters
let g:indentLine_char_list = ['│', '┆', '┊', '╵']"}}}

" lightline{{{
" Set colorscheme
let g:lightline = {
      \ 'colorscheme': 'gruvbox'
      \ }"}}}

" netrw{{{
" Remove the useless banner
let g:netrw_banner = 0

" Set it to a nice view style
let g:netrw_liststyle = 3

" Make netrw smaller
let g:netrw_winsize = 25"}}}

" rainbow{{{
" Enable rainbow parentheses
let g:rainbow_active = 1"}}}
"}}}

" KEYBINDINGS{{{
" Set the leader key
let mapleader = " "

" Force myself to use hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Make navigating through splits easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Make splits easier
map <leader>sv :split<CR>
map <leader>sh :vsplit<CR>

" Go through wrapped lines
map j gj
map k gk

" Go to next file
nnoremap <leader>n :wn<CR>
" Go to previous file
nnoremap <leader>p :wN<CR>

" Open netrw
nnoremap <leader>n :Vexplore<CR>

" Open todo window
map <F5> :TODOToggle<CR>

" Spell check
map <leader>sp :setlocal spell! spelllang=en_us<CR>"}}}
" vim: set foldmethod=marker:
