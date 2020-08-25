" plugins
call plug#begin('~/.vim/plugged')
    " enhancements
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'maximbaz/lightline-ale'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
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
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'lepture/vim-jinja'
    Plug 'elmcast/elm-vim'

    " color schemes
    Plug 'sainnhe/forest-night'
    Plug 'sainnhe/gruvbox-material'
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'sainnhe/sonokai'
    Plug 'ghifarit53/tokyonight-vim'
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
set shell=zsh

" more space for displaying messages
set cmdheight=2

" better user experience
set updatetime=300
set shortmess+=c
set signcolumn=yes
set showtabline=2
"set cursorline

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

" terminal
tnoremap <Esc> <C-\><C-n>

" nice line numbers
" augroup numbertoggle
"     autocmd!
"     autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"     autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" true color
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'soft'
let g:sonokai_style = 'andromeda'
colorscheme onedark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

" better netrw
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" let g:netrw_winsize = 20

" Disable netrw.
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Vifm.
let g:vifm_replace_netrw = 1
let g:vifm_term = "term"

" fzf
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}

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
nnoremap <F1> :call ChangeColorScheme("gruvbox-material")<CR>
nnoremap <F2> :call ChangeColorScheme("forest-night")<CR>
nnoremap <F3> :call ChangeColorScheme("nord")<CR>
nnoremap <F4> :call ChangeColorScheme("onedark")<CR>
nnoremap <F5> :call ChangeColorScheme("PaperColor")<CR>
nnoremap <F6> :call ChangeColorScheme("sonokai")<CR>
nnoremap <F7> :call ChangeColorScheme("tokyonight")<CR>

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#number_separator = '› '
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline = {
  \   'colorscheme': 'onedark',
  \   'active': {
  \     'left': [
  \         [ 'mode', 'paste' ],
  \         [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'tabline': {
  \     'left': [['buffers']],
  \     'right': [['']],
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_expand': {
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_type': {
  \     'buffers': 'tabsel',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
\ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
  \   'left': '⋮', 'right': '⋮' 
\}

function! s:goyo_enter()
    set wrap
    Limelight
endfunction

function! s:goyo_leave()
    set nowrap
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" bufferline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" let g:lightline#bufferline#composed_number_map = {
" \ 1:  '𝟣', 2:  '𝟤', 3:  '𝟥', 4:  '𝟦', 5:  '𝟧',
" \ 6:  '𝟨', 7:  '𝟩', 8:  '𝟪', 9:  '𝟫' }

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
