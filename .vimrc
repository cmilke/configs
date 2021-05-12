inoremap jk <ESC>
inoremap # <SPACE><BACKSPACE>#

"change leader key to space
nnoremap  <SPACE> <NOP>
let mapleader = "\<SPACE>" 

"colorscheme options
set t_Co=256
syntax on
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
colo industry

set hidden showcmd nowrap
autocmd FileType tex setlocal wrap linebreak breakindent "norelativenumber display+=lastline
autocmd FileType plaintex setlocal wrap linebreak breakindent "norelativenumber display+=lastline
autocmd FileType text setlocal wrap linebreak breakindent 
filetype plugin indent on

set laststatus=2
set wildmenu
set wildmode=list:longest
set nohlsearch
noremap <LEADER>/ :set hlsearch!<CR>
noremap <LEADER><SPACE> i <ESC>

nnoremap j gj
nnoremap k gk

"tab usage
nnoremap <LEADER>T :buffers<CR>:tab sbuffer 
nnoremap <LEADER>nt :tabe 
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

"set current dir to that of the current buffer
set autochdir

"window switching
nnoremap <LEADER>j <C-W>j
nnoremap <LEADER>k <C-W>k
nnoremap <LEADER>h <C-W>h
nnoremap <LEADER>l <C-W>l
nnoremap <LEADER>nj :belowright split 
nnoremap <LEADER>nk :aboveleft split 
nnoremap <LEADER>nh :aboveleft vertical split 
nnoremap <LEADER>nl :belowright vertical split 
nnoremap <LEADER>nn :e 
"Set windows to auto-scale with terminal resize
autocmd VimResized * wincmd = 

"paste mode
nnoremap <LEADER>p :set paste!<CR>  

"quick make
nnoremap <LEADER>m :wa<CR>:!make

"buffer switching
nnoremap <LEADER>b :buffers<CR>:b  
nnoremap <LEADER><S-J> :buffers<CR>:belowright sbuffer 
nnoremap <LEADER><S-K> :buffers<CR>:aboveleft sbuffer 
nnoremap <LEADER><S-H> :buffers<CR>:aboveleft vertical sbuffer 
nnoremap <LEADER><S-L> :buffers<CR>:belowright vertical sbuffer 
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>

"tag jumping
nnoremap <LEADER>ij :belowright split<CR><C-]>
nnoremap <LEADER>ik :aboveleft split<CR><C-]>
nnoremap <LEADER>ih :aboveleft vertical split<CR><C-]>
nnoremap <LEADER>il :belowright vertical split<CR><C-]>

"Lock and unlock vertical scrolling
nnoremap <LEADER>c :windo set scrollbind<CR>
nnoremap <LEADER>C :windo set noscrollbind<CR>

"turns tabs into spaces and sets shiftwidth to my preferred default
function Set_shift(n)
    let g:my_shift_size = a:n
    let &shiftwidth=g:my_shift_size
    let &tabstop=g:my_shift_size
    let &softtabstop=g:my_shift_size
endfunction
nnoremap <LEADER>=1 :call Set_shift(1)<CR>
nnoremap <LEADER>=2 :call Set_shift(2)<CR>
nnoremap <LEADER>=3 :call Set_shift(3)<CR>
nnoremap <LEADER>=4 :call Set_shift(4)<CR>
nnoremap <LEADER>=5 :call Set_shift(5)<CR>
nnoremap <LEADER>=6 :call Set_shift(6)<CR>
nnoremap <LEADER>=7 :call Set_shift(7)<CR>
nnoremap <LEADER>=8 :call Set_shift(8)<CR>
nnoremap <LEADER>=9 :call Set_shift(9)<CR>
nnoremap <LEADER>=- :set expandtab!<CR>
set autoindent
if !exists("g:my_shift_size")
    set expandtab
    call Set_shift(4)
endif

"fold control
function Fold_file()
    set foldmethod=indent
    set foldcolumn=4
    set foldenable
endfunction
nnoremap <LEADER>_ :call Fold_file()<CR>

function Unfold_file()
    set foldcolumn=0
    set nofoldenable
endfunction
nnoremap <LEADER>- :call Unfold_file()<CR>
