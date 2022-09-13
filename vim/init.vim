syntax on
set tabstop=4 softtabstop=4
set number
set autoindent
set expandtab
set relativenumber
set nu
set hlsearch
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

" themes
Plug 'sainnhe/everforest'
Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'

" utilities
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'

call plug#end()

" Colors
" match colors with terminal colors
 if (has("termguicolors"))
   set termguicolors
 endif

" tokyonight preference
let g:tokyonight_style="storm"

" colorscheme
colorscheme everforest

"File browser
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.*.swp']
let NERDTreeMinimalUI = 1

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

" Functions
" trims whitespace from file
fun! Trimwhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" press tab to autocomplete
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
" double tap i to quit insert mode
inoremap ii <Esc>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" to avoid pressing shift to enter command mode
nnoremap , :
vnoremap , :

" refactor code
nnoremap <F2> gg=G

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move line or selected block down alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" auto complete "'([{
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
vnoremap ++ <plug>NERDCommenterToggle
nnoremap ++ <plug>NERDCommenterToggle
