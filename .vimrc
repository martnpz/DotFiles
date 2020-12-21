" Set compatibility to Vim only.
set nocompatible
set nolist
set rnu

" Theme.
" colorscheme koehler
colorscheme gruvbox
set background=dark

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines.
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from
" outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the
" width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=2
set softtabstop=4
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=8

" Fixes common backspace problems.
set backspace=indent,eol,start

" Speed up scrolling in Vim.
set ttyfast

" Status bar.
set laststatus=2

" Display options.
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers.
set number

" Set status line display.
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding.
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" Keyabinding
let mapleader = ","
noremap <leader>t :tabnew<cr>
noremap <leader>tt :tabNext
noremap <leader>e :Vifm
noremap <leader>w :w<cr>
noremap <leader>q1 :q!<cr>
noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>
noremap <leader><cr> <cr><c-w>h:q<cr>

" More stuffs
set noerrorbells
set smartindent
set nu
set nowrap
set smartcase
" Dir where your undo history will be saving.
set undodir=~/.vim/undodir
set undofile
" Legacy search regex based.
set incsearch
set nohlsearch
" Column.
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=green

" plugins.
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-22ruby/vim-ruby'
Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'VundleVim/vundle.vim'
Plug 'mattn/emmet-vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'tpope/vim-dispatch'
Plug 'chemzqm/vim-run'
Plug 'ryanoasis/vim-devicons'
Plug 'ObserverOfTIme/coloresque.vim'
Plug 'vifm/vifm.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentline'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'dense-analysis/ale'

call plug#end()

" coc_shortcut
"let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let showtabline = 2

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap a i
:imap aa <Esc>

let g:user_emmet_leader_key = '<C-Z>'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Mouse actions.
set mouse=i
set ttymouse=sgr

" Run code.
let g:vim_run_command_map = {
  \'javascript': 'node',
  \'ruby': 'ruby',
  \'python': 'python',
  \}

" Highlight colors
let g:coloresque_extra_filetypes = ['python']
