set t_Co=256
syntax on
colorscheme swombat256

" pathogen.vim to manage runtimepath
execute pathogen#infect()

" Move 8
"nnoremap <C-j> 8j
"nnoremap <C-k> 8k
"nnoremap <C-h> 8h
"nnoremap <C-l> 8l

nnoremap j gj
nnoremap k gk

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

