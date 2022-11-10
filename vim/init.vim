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
set showmatch
set shiftwidth=2
set encoding=UTF-8
set mouse=a
set bg=dark

" Plugs
call plug#begin('~/.config/nvim/plugged')

" themes
Plug 'folke/tokyonight.nvim'
Plug 'arcticicestudio/nord-vim'

" utilities
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme tokyonight-night

let g:lightline = {'colorscheme': 'tokyonight'}

let mapleader = "."

"File browser
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.*.swp']
let NERDTreeMinimalUI = 1

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php'
let g:closetag_filetypes = 'html,xhtml,phtml,php'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }

let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" use shifted L and H to move between tabs
nnoremap H gT
nnoremap L gt

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

" Remaps
" double tap i to quit insert mode
inoremap ii <Esc>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>

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
