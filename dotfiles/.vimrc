set t_Co=256
syntax on
colorscheme gruvbox

" pathogen.vim to manage runtimepath
execute pathogen#infect()

" Move 8
inoremap <C-j> <Down><Down><Down><Down><Down><Down><Down><Down>
inoremap <C-k> <Up><Up><Up><Up><Up><Up><Up><Up>
inoremap <C-h> <Left><Left><Left><Left><Left><Left><Left><Left>
inoremap <C-l> <Right><Right><Right><Right><Right><Right><Right><Right>
vnoremap <C-j> 8j
vnoremap <C-k> 8k
vnoremap <C-h> 8h
vnoremap <C-l> 8l
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

nnoremap j gj
nnoremap k gk
nnoremap <C-j> j
nnoremap <C-k> k
nnoremap <C-h> 8zh
nnoremap <C-l> 8zl

nnoremap <C-m> :set wrap!<CR>
let @j=':%!python -m json.tool'
let @l=':%s///n'
let @k=':g!//d'
let @d=':g//d'

" Clear search buffer with ,/
nmap <silent> ,/ :nohlsearch<CR>
" Ctrl+P to jump forward
nnoremap <C-p> <C-i>

" Use w!! to write if sudo was not used to open file
cmap w!! w !sudo tee % >/dev/null

" Use Ctrl-{hjkl} to move between splitted windows
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Tab/Shift-Tab for navigating between tabs
map <Tab> gt
map <S-Tab> gT

set number
set ignorecase
set expandtab
set ts=4
set shiftwidth=4
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch
set incsearch     " show search matches as you type
set smartindent
set scrolloff=5
"set mouse=a
set tabpagemax=30
"set hidden
set cursorline
"set wildignore=*.swp,*.bak,*.pyc,*.class
set splitright
set splitbelow
set wildmenu
set lazyredraw

filetype plugin indent on
" Use 2 spaces for certain files
autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2
autocmd FileType text setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2

" Hopefully I won't regret this
set noswapfile
set nobackup

" To increment and decrement alpha wiht C-a and C-x
"set nf=octal,hex,alpha

" Ctrl+N to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Ignore file extensions
let NERDTreeIgnore = ['\.o$', '\.lo$']
let g:NERDTreeWinSize=60

function! SwitchSourceHeader()
  if (expand ("%:e") == "cc")
    find %:t:r.h
  else
    find %:t:r.cc
  endif
endfunction
nmap ,s :call SwitchSourceHeader()<CR>

" Single leader for EasyMotion prefix
map <Leader> <Plug>(easymotion-prefix)

" * does not jump
map * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

