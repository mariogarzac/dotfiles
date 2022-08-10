syntax on
set tabstop=4 softtabstop=4
set number
set autoindent
set expandtab
set relativenumber
set nu
set nohlsearch
set hidden
set nowrap
set noswapfile
set nobackup
set nowritebackup
set incsearch
set scrolloff=17
set signcolumn=yes
set colorcolumn=80
set guicursor=i:block
set autoread

" Plugs
call plug#begin('~/.dotfiles/vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'ghifarit53/tokyonight-vim'

call plug#end()



" Match colors with terminal colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:tokyonight_style="storm"
colorscheme tokyonight

"File browser
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.*.swp']
let NERDTreeMinimalUI = 1

" Functions
" trims whitespace from file
fun! Trimwhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


augroup MOO
    autocmd!
    autocmd BufwritePre * :call Trimwhitespace()
augroup END

" Remaps
" Double tap i to quit insert mode
inoremap ii <Esc>

" Press tab to autocomplete
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" To avoid pressing shift to enter command mode
nnoremap , :
vnoremap , :

" Bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move line or selected block down alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle