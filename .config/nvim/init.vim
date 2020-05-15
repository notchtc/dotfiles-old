if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

set number relativenumber
set hlsearch
set noshowmode
set mouse+=a
set guicursor+=a:blinkon1

map <C-n> :NERDTreeToggle<CR>

set clipboard=unnamedplus

map <F5> :setlocal spell! spelllang=pl_pl<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>

autocmd BufWritePost config.h,config.def.h !sudo make clean install
autocmd BufWritePost .zshrc,.ea !. ~/.config/zsh/.zshrc
autocmd BufWritePost .Xresources !xrdb ~/.Xresources

let g:lightline = {
      \ 'colorscheme': 'selenized_dark',
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


