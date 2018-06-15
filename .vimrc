
set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Syntax
Plugin 'elzr/vim-json'
Plugin 'smintz/vim-sqlutil'
Plugin 'ap/vim-css-color'

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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'

" Visual
Plugin 'itchyny/lightline.vim' 
Bundle 'daviesjamie/vim-base16-lightline'
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


highlight Comment gui=italic
highlight Comment cterm=italic
highlight Type cterm=italic
highlight Type gui=italic

set noshowmode
set laststatus=2
" STATUS LINE
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

 function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
      else
        return "\<c-p>"
      endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>

autocmd BufWritePost .vimrc source %
