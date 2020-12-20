" plugins
call plug#begin('~/.vim/plugged')
" enhancements
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'pnpm install' }
"Plug 'itchyny/lightline.vim'
Plug 'glepnir/galaxyline.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'numtostr/FTerm.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
    map  gc  <Plug>Commentary
    nmap gcc <Plug>CommentaryLine

" vim-task
Plug 'kvrohit/nvim-tasks'

" lsp
Plug 'neovim/nvim-lsp'
" completion
Plug 'nvim-lua/completion-nvim'
" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'

" language support
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ElmCast/elm-vim'

" color schemes
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'RohanPoojary/pleasant.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ayu-theme/ayu-vim'
Plug 'glepnir/zephyr-nvim'
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

" global clipboard
set clipboard+=unnamedplus

" make it so that long lines wrap smartly
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
au TermOpen * setlocal nonu nornu
nnoremap <leader>i :FTermToggle<CR>

" true color
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark
let ayucolor="mirage"
colorscheme zephyr

au! BufNewFile,BufRead *.svelte set ft=html

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

" better netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 20

" fzf
let $FZF_DEFAULT_OPTS = '--color=dark --reverse --keep-right --marker=+ --ansi'
let $FZF_DEFAULT_COMMAND = 'fd --type f --type l --hidden --follow --color=always --exclude .git --exclude node_modules || git ls-files --cached --others --exclude-standard'
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
nnoremap <F1> :call ChangeColorScheme("gruvbox8")<CR>
nnoremap <F2> :call ChangeColorScheme("pleasant")<CR>
nnoremap <F3> :call ChangeColorScheme("onedark")<CR>
nnoremap <F4> :call ChangeColorScheme("iceberg")<CR>
nnoremap <F5> :call ChangeColorScheme("nightfly")<CR>
nnoremap <F6> :call ChangeColorScheme("ayu")<CR>

let g:lightline = {
  \   'colorscheme': 'ayu',
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

" completion-nvim
" use <tab> and <s-tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" avoid showing message extra message when using completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 3

lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        disable = { "svelte" },
    },
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
    }
)

local lsp = require'lspconfig'
lsp.bashls.setup({})
lsp.vimls.setup({})
lsp.elmls.setup({})
lsp.jsonls.setup({})
lsp.yamlls.setup({})
lsp.html.setup({})
lsp.cssls.setup({})
require'colorizer'.setup {
    css = { css = true; }
}

local gl = require('galaxyline')
local gls = gl.section
local glf = require('galaxyline.provider_fileinfo')
local glb = require('galaxyline.provider_buffer')

local colors = {
  bg = '#282c34',
  line_bg = '#353644',
  fg = '#dddddd',
  fg_green = '#65a380',

  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#c678dd',
  blue = '#51afef';
  red = '#ec5f67'
}

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = {colors.line_bg,colors.blue}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {n = 'N',i = 'I',c= 'C',V= 'V', [''] = 'V'}
      return alias[vim.fn.mode()] .. ' '
    end,
    separator = ' ',
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.darkblue,colors.blue,'bold'},
  },
}
gls.left[3] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.bg}
  }
}
gls.right[1]= {
  FileFormat = {
    provider = function()
        return ' ' .. glf.get_file_format()
    end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.fg,colors.bg},
  }
}
gls.right[2] = {
  BufferType = {
    provider = function()
        return glb.get_buffer_filetype():lower()
    end,
    separator = ' ⋮ ',
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.fg,colors.bg}
  }
}
gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ⋮ ',
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.fg,colors.bg}
  },
}
gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.blue,colors.bg},
    highlight = {colors.darkblue,colors.blue,'bold'},
  }
}
gls.right[5] = {
  LastElement = {
    provider = function() return '' end,
    highlight = {colors.line_bg,colors.blue}
  },
}
EOF

" lsp mappings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<cr>
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> J     <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<cr>
vnoremap <silent> ga    <cmd>'<,'>lua vim.lsp.buf.range_code_action()<cr>

" goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

" use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" ale
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'svelte': ['stylelint', 'eslint']}
let g:ale_fixers = {
\   'html': ['prettier'],
\   'svelte': ['prettier', 'eslint'],
\}

" barbar
" magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" sort automatically by...
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" " move to previous/next
nnoremap <silent> <leader>bp :BufferPrevious<CR>
nnoremap <silent> <leader>bn :BufferNext<CR>
" re-order to previous/next
" nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
" nnoremap <silent>    <A->> :BufferMoveNext<CR>
" goto buffer in position...
nnoremap <silent> <leader>1 :BufferGoto 1<CR>
nnoremap <silent> <leader>2 :BufferGoto 2<CR>
nnoremap <silent> <leader>3 :BufferGoto 3<CR>
nnoremap <silent> <leader>4 :BufferGoto 4<CR>
nnoremap <silent> <leader>5 :BufferGoto 5<CR>
nnoremap <silent> <leader>6 :BufferGoto 6<CR>
nnoremap <silent> <leader>7 :BufferGoto 7<CR>
nnoremap <silent> <leader>8 :BufferGoto 8<CR>
nnoremap <silent> <leader>9 :BufferLast<CR>
" close buffer
nnoremap <silent> <leader>bd :BufferClose<CR>
let bufferline = {}
let bufferline.animation = v:false
let bufferline.icons = 'numbers'
let bufferline.closable = v:false
let bufferline.clickable = v:false
let bufferline.semantic_letters = v:true
let bufferline.letters =
  \ 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'
let bufferline.maximum_padding = 999
