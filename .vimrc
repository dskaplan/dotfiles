
set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Syntax
Plugin 'sheerun/vim-polyglot'
" Utiltiies
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tmsvg/pear-tree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'psf/black'
" Plugin 'neoclide/coc.nvim'
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
"" Visual
Plugin 'joshdick/onedark.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'

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
set wildignore+=*/tmp/*,*.zip,*.pyc,*/env/*,*/.git/*
" Visual stuff
set enc=utf-8
set termguicolors
set t_ut= " improve screen clearing by using the background color

" Start scrolling 3 lines before the border
set scrolloff=3

" Middle of the line
map gm :call cursor(0, virtcol('$')//2)<CR>

"Remap start and end. This feels better.
nnoremap B ^
nnoremap ^ <nop>
nnoremap E $
nnoremap % <nop>

" jk -> Esc.
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

"
" Ctrl P stuff
"
nmap ; :CtrlPCurWD<CR>
let g:ctrlp_lazy_update = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_switch_buffer = 'Et'

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
au BufNewFile,BufRead *.csv,*.tsv,*.txt set tw=0 noet sts=0

"
" NerdCommenter
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"
" Pear tree for matching pairs
"
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }


let g:pear_tree_ft_disabled = []
" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1
" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1

"
" VISUAL STUFF
let base16colorspace=256
"colorscheme base16-eighties
colorscheme onedark 


if !has('gui_running')
  set t_Co=256
endif
set noshowmode

let g:lightline = {
      \ 'active': {
      \ 'colorscheme': 'onedark',
      \   'left': [[ 'mode', 'paste' ], [ 'filename' ]],
      \   'right': [[ 'gitbranch'], [ 'filetype', 'percent' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
autocmd BufWritePost .vimrc source %
