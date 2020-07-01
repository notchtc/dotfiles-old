if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')
Plug 'Chiel92/vim-autoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
call plug#end()

set number relativenumber
set hlsearch
set mouse+=a
set guicursor+=a:blinkon1

set clipboard=unnamedplus

set termguicolors
set background=dark
autocmd vimenter * colorscheme gruvbox

let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1

map <F5> :setlocal spell! spelllang=pl_pl<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>

autocmd BufWritePost config.h,config.def.h,blocks.h !sudo make clean install
autocmd BufWritePost .zshrc,.ea !. ~/.config/zsh/.zshrc
autocmd BufWritePost .Xresources !xrdb ~/.config/X11/.Xresources

au BufWrite * :Autoformat

let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
