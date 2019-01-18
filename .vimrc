
set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Syntax
Plugin 'smintz/vim-sqlutil'
Plugin 'ap/vim-css-color'
Plugin 'chrisbra/csv.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'edkolev/tmuxline.vim'
" Utiltiies
Plugin 'mattn/emmet-vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'alvan/closetag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'tpope/vim-surround'
Plugin 'neoclide/coc.nvim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'prettier/vim-prettier'
"" Visual
Plugin 'Nequo/vim-allomancer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'

call vundle#end() 

filetype plugin indent on 

syntax enable

let mapleader=','

set showcmd
set lazyredraw
set ttyfast

set showmatch
set incsearch
set hlsearch

set clipboard=unnamed
set cursorline
set expandtab
set noswapfile
set nowrap
set number
set relativenumber
set ruler
set splitright

set foldlevel=10
set foldmethod=indent
set nofoldenable
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=180
set inccommand=nosplit
set backspace=indent,eol,start
set isk+=@,%,#
set wildignore+=*/tmp/*,*.zip,*.pyc,*/env/*

" Start scrolling 3 lines before the border
set scrolloff=3

" NO ARROW KEYS COME ON
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

" Middle of the line
map gm :call cursor(0, virtcol('$')//2)<CR>

"Remap start and end. This feels better.
nnoremap B ^
nnoremap ^ <nop>
nnoremap E $
nnoremap % <nop>

" jk lol? Esc.
inoremap jk <esc>

" Split sick bars
nmap <leader>w :set wrap!<cr>
nmap <leader>W :set nowrap<cr>

" Move lines up and down
nmap <leader>d :m+<CR>==
nmap <leader>e :m-2<CR>==
inoremap <leader>d <Esc>:m+<CR>==gi
inoremap <leader>e <Esc>:m-2<CR>==gi
vnoremap <leader>d <Esc>:m+<CR>==gv
vnoremap <leader>e <Esc>:m-2<CR>==gv

" Navigate panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear search
nnoremap <leader><space> :nohlsearch<CR>
nnoremap S :noh<CR>

" Keep selection after indent
vnoremap < <gv
vnoremap > >gv

" Pane splits
map vv :vsplit<CR>
map ss :split<CR>

map <leader>i :IndentGuidesToggle<CR>
map <leader>r :RainbowParenthesesToggle<CR>

" Ctrl P stuff
nmap ; :CtrlPCurWD<CR>
set wildignore+=*/tmp/*,*.zip,*.pyc,*/env/*,*/.git/*
let g:ctrlp_lazy_update = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_switch_buffer = 'Et'

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
au BufNewFile,BufRead *.csv,*.tsv,*.txt set tw=0 noet sts=0

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive',     
                          \ 'active_filetypes': [],     
                          \ 'passive_filetypes': [] } 
let g:syntastic_auto_loc_list=1
nnoremap <silent><leader>s :SyntasticCheck<CR>

" VISUAL STUFF
set termguicolors

set t_ut= " improve screen clearing by using the background color
" set background=dark
let base16colorspace=256
colorscheme base16-eighties
" let $TERM='screen-256color'
set enc=utf-8
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_skip_empty_sections = 1


" Compltetion Stuffs
" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()



autocmd FileType vim let b:vcm_tab_complete = 'vim'

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" let g:deoplete#enable_at_startup = 1
let g:loaded_python_provider = 1

autocmd BufWritePost .vimrc source %
