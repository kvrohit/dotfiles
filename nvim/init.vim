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
    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'cocopon/lightline-hybrid.vim'
    Plug 'mhinz/vim-startify'
    Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim.vim'
    Plug 'dense-analysis/ale'

    " vifm
    Plug 'vifm/vifm.vim'

    " vim-task
    Plug 'kvrohit/nvim-tasks'

    " language support
    Plug 'rust-lang/rust.vim'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " color schemes
    Plug 'morhetz/gruvbox'
    Plug 'w0ng/vim-hybrid'
call plug#end()

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

colorscheme gruvbox
set background=dark
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

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

function! ChangeColorScheme(scheme) abort
    let g:lightline.colorscheme = a:scheme
    execute "colorscheme " . a:scheme
    hi! Normal ctermbg=NONE guibg=NONE 
    hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

" switch colorscheme
nnoremap <F1> :call ChangeColorScheme("gruvbox")<CR>
nnoremap <F2> :call ChangeColorScheme("hybrid")<CR>

" open vifm
nnoremap <F5> :Vifm<CR>

" clipboard
noremap <leader>yy "*y
noremap <leader>pp "*p

source $HOME/.config/nvim/plug-config/coc.vim

