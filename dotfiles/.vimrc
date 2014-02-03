set t_Co=256
colorscheme swombat256

" Move 8
nnoremap <C-j> 8j
nnoremap <C-k> 8k
nnoremap <C-h> 8h
nnoremap <C-l> 8l

" Use Ctrl-{hjkl} to move between splitted windows
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Tab/Shift-Tab for navigating between tabs
map <Tab> gt
map <S-Tab> gT

set number
set expandtab
set ts=4
set shiftwidth=4
set hlsearch
set smartindent
set scrolloff=5
"set mouse=a

set cursorline

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
