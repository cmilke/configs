"A file to configure my default settings for vim

"""""""""""""""""""""""""""
"fundamental configuration"
"""""""""""""""""""""""""""

inoremap jk <ESC>
inoremap # <SPACE><BACKSPACE>#


"change leader key to space
nnoremap  <SPACE> <NOP>
let mapleader = "\<SPACE>" 

"colorscheme options
set t_Co=256
syntax on
colo landscape

set hidden showcmd nowrap
autocmd FileType text setlocal wrap linebreak breakindent norelativenumber display+=lastline
autocmd FileType tex setlocal wrap linebreak breakindent norelativenumber display+=lastline
autocmd FileType plaintex setlocal wrap linebreak breakindent norelativenumber display+=lastline

set laststatus=2
set wildmenu
set wildmode=list:longest
set nohlsearch
noremap <LEADER>/ :set hlsearch!<CR>
noremap <LEADER>s :setlocal spell! spelllang=en_us<CR>
noremap <LEADER>x :w<CR>:!pdflatex %<CR>
noremap <LEADER><SPACE> i <ESC>

nnoremap j gj
nnoremap k gk


"tab usage
nnoremap <F2> :tabe 
nnoremap <F3> :tabp<CR>
nnoremap <F4> :tabn<CR>

"window switching
nnoremap <LEADER>j <C-W>j
nnoremap <LEADER>k <C-W>k
nnoremap <LEADER>h <C-W>h
nnoremap <LEADER>l <C-W>l
nnoremap <LEADER><S-J> :buffers<CR>:belowright sbuffer 
nnoremap <LEADER><S-K> :buffers<CR>:aboveleft sbuffer 
nnoremap <LEADER><S-H> :buffers<CR>:aboveleft vertical sbuffer 
nnoremap <LEADER><S-L> :buffers<CR>:belowright vertical sbuffer 
"nnoremap <LEADER><S-J> :belowright split 
"nnoremap <LEADER><S-K> :aboveleft split 
"nnoremap <LEADER><S-H> :aboveleft vertical split 
"nnoremap <LEADER><S-L> :belowright vertical split 


"buffer switching
nnoremap <LEADER>b :buffers<CR>:b  

"turns tabs into spaces and sets shiftwidth
let g:my_shift_size = 4

let &tabstop=g:my_shift_size
let &shiftwidth=g:my_shift_size
let &softtabstop=g:my_shift_size
set expandtab
set smartindent
autocmd FileType make setlocal noexpandtab "special command for makefiles that makes tabs actual tabs

function Set_shift(n)
    let g:my_shift_size = a:n
    let &tabstop=g:my_shift_size
    let &shiftwidth=g:my_shift_size
    let &softtabstop=g:my_shift_size
endfunction
nnoremap <LEADER>== :call Set_shift(g:my_shift_size)<CR>
nnoremap <LEADER>=1 :call Set_shift(1)<CR>
nnoremap <LEADER>=2 :call Set_shift(2)<CR>
nnoremap <LEADER>=3 :call Set_shift(3)<CR>
nnoremap <LEADER>=4 :call Set_shift(4)<CR>
nnoremap <LEADER>=5 :call Set_shift(5)<CR>


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
