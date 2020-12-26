vim.cmd [[packadd paq-nvim]]

local paq = require('paq-nvim').paq

-- paq
paq {'savq/paq-nvim', opt = true}

-- color schemes
paq {'ulwlu/elly.vim'}
paq 'sainnhe/edge'
paq 'pineapplegiant/spaceduck'

-- fzf
paq {'junegunn/fzf', hook = vim.fn['fzf#install']}
paq 'junegunn/fzf.vim'

-- enhancements
paq 'nvim-treesitter/nvim-treesitter'
paq {'neovim/nvim-lspconfig'}
paq 'nvim-lua/plenary.nvim'
paq 'tjdevries/express_line.nvim'

-- essentials
paq 'tpope/vim-repeat'
paq 'tpope/vim-surround'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-commentary'
paq 'kvrohit/nvim-tasks'

-- additional filetype support
paq 'evanleck/vim-svelte'

-- linting
paq 'dense-analysis/ale'
