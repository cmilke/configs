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
filetype plugin on

set laststatus=2
set wildmenu
set wildmode=list:longest
set nohlsearch
noremap <LEADER>/ :set hlsearch!<CR>
noremap <LEADER>s :setlocal spell! spelllang=en_us<CR>
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

"quick remote git syncing
nnoremap <LEADER>G :!gitsync<CR>

"buffer switching
nnoremap <LEADER>b :buffers<CR>:b  
nnoremap <LEADER><S-J> :buffers<CR>:belowright sbuffer 
nnoremap <LEADER><S-K> :buffers<CR>:aboveleft sbuffer 
nnoremap <LEADER><S-H> :buffers<CR>:aboveleft vertical sbuffer 
nnoremap <LEADER><S-L> :buffers<CR>:belowright vertical sbuffer 
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>

"Lock and unlock vertical scrolling
nnoremap <LEADER>c :windo set scrollbind<CR>
nnoremap <LEADER>C :windo set noscrollbind<CR>

"autocmd FileType make setlocal noexpandtab "special command for makefiles that makes tabs actual tabs

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
