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
set shiftwidth=2

" Plugs
call plug#begin('~/.dotfiles/vim/plugged')

Plug 'ghifarit53/tokyonight-vim'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'

call plug#end()



" Match colors with terminal colors
" " color schemes
 if (has("termguicolors"))
   set termguicolors
 endif

let g:tokyonight_style="night"
colorscheme xcodedarkhc


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

augroup MOO
    autocmd!
    autocmd BufwritePre * :call Trimwhitespace()
augroup END

let mapleader = " "

" Remaps
" Double tap i to quit insert mode
inoremap ii <Esc>

" To avoid pressing shift to enter command mode
nnoremap , :
vnoremap , :

" Refactor code
nnoremap <F2> gg=G

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
vnoremap ++ <plug>NERDCommenterToggle
nnoremap ++ <plug>NERDCommenterToggle

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


