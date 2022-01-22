filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ajh17/vimcompletesme'
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'direnv/direnv.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liuchengxu/vista.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'samoshkin/vim-mergetool'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

syntax on

set title
set list
set listchars=eol:↩,tab:│\ ,extends:»,precedes:«
" set spell spelllang=en_us

set updatetime=2000
set backupcopy=yes
set nohlsearch
set guicursor=

let g:local_vimrc = ['.lvimrc']
call lh#local_vimrc#munge('whitelist', $HOME.'/*')

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

let g:vista_disable_statusline = 1
let g:vista_icon_indent = ["╰─▶︎ ", "├─▶︎ "]
let g:vista_default_executive = 'nvim_lsp'

let g:nvim_tree_icons = { 'git': { 'staged': '✓', 'unstaged': '✕', 'ignored': "" } } " ﬒" } }

set termguicolors
set background=dark
colorscheme sonwell

set hidden
set cursorline
set number
set exrc
set splitbelow
set breakindent
set linebreak

set foldnestmax=10
set nofoldenable
set foldlevel=99

set backspace=2
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set fillchars=vert:│
set belloff=all

filetype plugin indent on
set autoindent

" let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = ''
let g:airline_powerline_fonts = 1
let g:airline_theme = 'sonwell'

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

noremap <C-n> :NvimTreeToggle<CR>
" noremap <C-t> :vsp \| wincmd b \| terminal ++curwin<CR>

au TermOpen * set nonumber
au BufNew NvimTree set cursorline

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Skip moving into normal mode to move out of terminal
tnoremap <C-w> <C-\><C-n><C-w>
autocmd BufWinEnter,WinEnter,BufEnter term://* startinsert
" autocmd NvimTreeView BufWinEnter NvimTree hi CursorRow guibg=#ff0000
"
lua require 'plugins'
augroup NvimWebDevicons | autocmd! | augroup END
