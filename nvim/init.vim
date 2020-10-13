" plugins
call plug#begin('~/.vim/plugged')
    " enhancements
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    " Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
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

    " Collection of common configurations for the Nvim LSP client
    Plug 'neovim/nvim-lspconfig'
    " Extensions to built-in LSP, for example, providing type inlay hints
    Plug 'tjdevries/lsp_extensions.nvim'
    " Autocompletion framework for built-in LSP
    Plug 'nvim-lua/completion-nvim'
    " Diagnostic navigation and settings for built-in LSP
    Plug 'nvim-lua/diagnostic-nvim'

    " Language support
    Plug 'rust-lang/rust.vim'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'ElmCast/elm-vim'

    " snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    " color schemes
    Plug 'gruvbox-community/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'RohanPoojary/pleasant.vim'
    Plug 'bluz71/vim-nightfly-guicolors'
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

" better user experience
set cmdheight=1
set updatetime=1000
set shortmess+=c
set signcolumn=yes
set showtabline=2
set cursorline
set completeopt-=preview
set scrolloff=10

" Global clipboard
set clipboard+=unnamedplus

" Make it so that long lines wrap smartly
set breakindent
let &showbreak=repeat(' ', 3)
set linebreak

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
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" true color
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark = 'soft'
colorscheme pleasant

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
" noremap <leader>yy "*y
" noremap <leader>pp "*p

" tasks
nnoremap <leader>tt :ToggleTask<CR>
nnoremap <leader>td :UndoTask<CR>

function! ChangeColorScheme(scheme) abort
    let g:lightline.colorscheme = a:scheme
    execute "colorscheme " . a:scheme
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

" switch colorscheme
nnoremap <F1> :call ChangeColorScheme("gruvbox")<CR>
nnoremap <F2> :call ChangeColorScheme("pleasant")<CR>
nnoremap <F3> :call ChangeColorScheme("onedark")<CR>
nnoremap <F4> :call ChangeColorScheme("iceberg")<CR>
nnoremap <F5> :call ChangeColorScheme("nightfly")<CR>

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#number_separator = '› '
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline = {
  \   'colorscheme': 'pleasant',
  \   'active': {
  \     'left': [
  \         [ 'mode', 'paste' ],
  \         [ 'gitbranch', 'readonly' ]
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
  \     'gitbranch': 'GitBranch',
  \   }
\ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
\}
let g:lightline.subseparator = {
  \   'left': '⋮', 'right': '⋮' 
\}

function! GitBranch() abort
    if fugitive#head() !=# ''
        return "\uE0A0 ".fugitive#head()
    else
        return ""
    endif
endfunction

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

" completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>"   : completion#trigger_completion()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : <SID>check_back_space() ? "\<S-Tab>" : completion#trigger_completion()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Code navigation shortcuts
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '100'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 3

lua << EOF
local nvim_lsp = require'nvim_lsp'

local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

nvim_lsp.vimls.setup({ on_attach=on_attach })
nvim_lsp.yamlls.setup({ on_attach=on_attach })
nvim_lsp.elmls.setup({ on_attach=on_attach })
nvim_lsp.bashls.setup({ on_attach=on_attach })
EOF
