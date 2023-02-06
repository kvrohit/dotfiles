-- Global statusline
vim.o.laststatus = 3

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Disable swap files
vim.o.swapfile = false

-- Scroll offsets
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Sane splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Disable show mode
vim.o.showmode = false

-- Clean UI
vim.o.cmdheight = 0

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
