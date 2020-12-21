" If shell is fish change it to sh
if &shell =~# 'fish$'
    set shell=sh
endif

" PLUGINS{{{1
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
Plug 'mengelbrecht/lightline-bufferline'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " You need to install go
Plug 'Dimercel/todo-vim'
Plug 'dag/vim-fish'
call plug#end()"}}}

" SETTINGS{{{1
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

" Folding based on syntax
set foldmethod=syntax
" Set maximum fold nesting
set foldnestmax=2

" Be able to see vim keybindings in awesome when using an alias
set title"}}}

" AUTOCMD{{{1
" Remove trailing whitespace and newlines when saving
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"}}}

" LOOKS{{{1
colorscheme gruvbox
set termguicolors
set background=dark
set noshowmode
hi Normal ctermbg=NONE guibg=NONE"}}}

" PLUGIN CONFIG{{{1
" fish{{{
" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish

" Enable folding of block structures in fish.
autocmd FileType fish set foldmethod=expr"}}}

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
let g:lightline = {
    \ 'colorscheme' : 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ] ],
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': []
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype'
    \ },
    \ }

" Get tabline to show
set showtabline=2

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction"}}}

" lightline-bufferline{{{
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
"}}}

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

" KEYBINDINGS{{{1
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
map <leader>sp :setlocal spell! spelllang=en_us<CR>

" Switch buffers
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Delete buffers
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

"}}}
" vim: set foldmethod=marker:
