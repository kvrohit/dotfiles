" plugins
call plug#begin('~/.vim/plugged')
    " enhancements
    Plug 'mhinz/vim-startify'
    Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim.vim'
    Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
      map  gc  <Plug>Commentary
      nmap gcc <Plug>CommentaryLine

    " vifm
    Plug 'vifm/vifm.vim'

    " vim-task
    Plug 'kvrohit/nvim-tasks'

    " language support
    Plug 'rust-lang/rust.vim'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    " color schemes
    Plug 'sainnhe/forest-night'
    Plug 'sainnhe/gruvbox-material'
    Plug 'arcticicestudio/nord-vim'
call plug#end()

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
nmap <leader>d :bd<CR>

" quick-save
nmap <leader>w :w<CR>

" nice line numbers
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" true color
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

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

nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>
nnoremap <leader>se :Vsplit<CR>

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
    elseif (a:scheme == "gruvbox-material")
        let l:color = "gruvbox_material"
    endif
    let g:lightline.colorscheme = l:color
    execute "colorscheme " . a:scheme
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

" switch colorscheme
nnoremap <F1>  :call ChangeColorScheme("gruvbox-material")<CR>
nnoremap <F2>  :call ChangeColorScheme("forest-night")<CR>
nnoremap <F3>  :call ChangeColorScheme("nord")<CR>

let g:lightline = {
  \   'colorscheme': 'gruvbox_material',
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

" coc config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

