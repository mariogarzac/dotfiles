" ================ General Config =================
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

" ==================== Plug =======================
call plug#begin('~/.config/nvim/plugged')

" themes
Plug 'folke/tokyonight.nvim'

" utilities
Plug 'tmsvg/pear-tree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" =================== Colors ======================
set termguicolors

colorscheme tokyonight-night

let g:lightline = {'colorscheme': 'tokyonight'}


" ==================== Closetag ===================
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


" ================== Functions ====================
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

" ================== Remaps =======================
" leader
let mapleader = " "

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

" =============== Buffer management ===============
" Move between buffers using H and L
nnoremap <leader>h :bn<CR>
nnoremap <leader>l :bp<CR>

" Create new empty buffer using T
nnoremap <leader>t :enew<CR>

" Close current buffer and move to previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show current buffers and their status
nmap <leader>bl :ls<CR>

" =================== Telescope ===================
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" ================== NERDTree =====================
let NERDTreeQuitOnOpen=1
nnoremap <C-N> :NERDTreeToggle<CR>



