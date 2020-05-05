if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'ObserverOfTime/coloresque.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

set number relativenumber
set hlsearch
set noshowmode
set clipboard=unnamedplus
set mouse+=a
set guicursor+=a:blinkon1
set background=dark

map <C-n> :NERDTreeToggle<CR>

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': { 
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \},
      \ ' component': {
      \   'lineinfo': '%31:%-2v%<',
      \},
      \}

let g:coloresque_extra_filetypes = ['vim', 'text']

