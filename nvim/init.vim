syntax on

set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set autoread
set noshowmode

" more space for displaying messages
set cmdheight=2

" better user experience
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cursorline

" sane split
set splitright
set splitbelow

let mapleader = " "

" open
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
nmap <leader><leader> :bn<CR>

" quick-save
nmap <leader>w :w<CR>

" nice line numbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" plugins
call plug#begin('~/.vim/plugged')
    " enhancements
    Plug 'mhinz/vim-startify'
    Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim.vim'
    Plug 'dense-analysis/ale'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'

    " vifm
    Plug 'vifm/vifm.vim'

    " vim-task
    Plug 'kvrohit/nvim-tasks'

    " language support
    Plug 'rust-lang/rust.vim'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    " color schemes
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'cocopon/lightline-hybrid.vim'
    Plug 'sainnhe/forest-night'
call plug#end()

colorscheme gruvbox
set background=dark

let g:lightline = {}
let g:lightline#colorscheme = 'gruvbox'

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

" better netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20

" auto format rust files on save
let g:rustfmt_autosave = 1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" open vifm
nnoremap <F12> :Vifm<CR>

" clipboard
noremap <leader>yy "*y
noremap <leader>pp "*p

" tasks
nnoremap <leader>tt :ToggleTask<CR>
nnoremap <leader>td :UndoTask<CR>

function! ChangeColorScheme(scheme) abort
    let l:color = a:scheme
    if (a:scheme == "forest-night")
        let l:color = "forest_night"
    endif
    let g:lightline.colorscheme = l:color
    execute "colorscheme " . a:scheme
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

" switch colorscheme
nnoremap <F1> :call ChangeColorScheme("gruvbox")<CR>
nnoremap <F2> :call ChangeColorScheme("hybrid")<CR>
nnoremap <F3> :call ChangeColorScheme("iceberg")<CR>
nnoremap <F4> :call ChangeColorScheme("nord")<CR>
nnoremap <F5> :call ChangeColorScheme("PaperColor")<CR>
nnoremap <F6> :call ChangeColorScheme("onedark")<CR>
nnoremap <F7> :call ChangeColorScheme("forest-night")<CR>

let g:lightline = {
  \   'active': {
  \     'left': [
  \         [ 'mode', 'paste' ],
  \         [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
\ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
  \   'left': '', 'right': '' 
\}

source $HOME/.config/nvim/plug-config/coc.vim

