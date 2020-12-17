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
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " You need to install go
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dag/vim-fish'
call plug#end()

"" MAKE YOUR LIFE BETTER ""
" Fancy line numbers
set relativenumber number

" Use system clipboard
set clipboard=unnamedplus

set nocompatible
set ignorecase
set smartcase

" Spaces > tabs
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4

" Better splitting
set splitbelow splitright

" Add an cursor line
set cursorline

" Show trailing spaces
set listchars=trail:·
set list

set updatetime=100

" Disable commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" LOOKS ""
colorscheme gruvbox
set termguicolors
set background=dark
set noshowmode
hi Normal ctermbg=NONE guibg=NONE

"" PLUGIN CONFIG ""
" fish
autocmd FileType fish compiler fish

" fzf
" Make fzf float and have a sharp border
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp' } }

" Functions and stuff
" Fuzzy search lines
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp' }})

" Show files in the same directory
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'fd . ' . cwd . ' --maxdepth 1'

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp' }})
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

" gitgutter
" Make GitGutter fit in
hi! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 1

" hexokinase
let g:Hexokinase_highlighters = ['virtual']

" indentline
" Set color to tab indent color
let g:indentLine_defaultGroup = 'SpecialKey'

" Set characters
let g:indentLine_char_list = ['│', '┆', '┊', '╵']

" lightline
" Set colorscheme
let g:lightline = {
      \ 'colorscheme': 'gruvbox'
      \ }

" netrw
" Remove the useless banner
let g:netrw_banner = 0

" Set it to a nice view style
let g:netrw_liststyle = 3

" Make netrw smaller
let g:netrw_winsize = 25

" rainbow
" Enable rainbow parentheses
let g:rainbow_active = 1

"" KEYBINDINGS ""
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

" Go through wrapped lines
map j gj
map k gk

" Make splits easier
map <leader>sv :split<CR>
map <leader>sh :vsplit<CR>

" Go to next file
nnoremap <leader>n :wn<CR>

" Go to previous file
nnoremap <leader>p :wN<CR>

" Fuzzy find lines
nnoremap <leader>fl :FZFLines<CR>

" Show neighbouring files
nnoremap <leader>fn :FZFNeigh<CR>

" Open netrw
nnoremap <leader>n :Vexplore<CR>
