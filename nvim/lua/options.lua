-- colorscheme
vim.api.nvim_set_option("termguicolors", true)
vim.g.substrata_italic_booleans = true
vim.g.substrata_italic_functions = true
vim.cmd([[colorscheme substrata]])
-- vim.g.tokyonight_transparent = true
-- vim.cmd [[colorscheme tokyonight]]
vim.cmd([[language en_US.utf-8]])

-- options
vim.opt.laststatus = 2
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.mouse = "a"
vim.opt.ruler = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess = vim.o.shortmess .. "c"
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"

-- indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.expandtab = true

-- set leader to space
vim.g.mapleader = " "
vim.b.mapleader = " "

-- indentline
vim.g.indent_blankline_setColors = 0
vim.g.indent_blankline_defaultGroup = "SpecialKey"
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_filetype_exclude = { "help", "fugitive", "packer" }
