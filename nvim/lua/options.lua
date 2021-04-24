-- set leader key to <Space>
vim.g.mapleader = ' '
vim.b.mapleader = ' '

vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.completeopt = 'menuone,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmode = false
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.mouse = 'a'

-- color
vim.g.syntax = true
vim.api.nvim_set_option('termguicolors', true) -- Enable 24bit color
-- vim.api.nvim_exec('autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE', false) -- Make sure the background color stays as transparent
vim.g.gruvbox_material_enable_italic = 1
vim.g.sonokai_enable_italic = 1
vim.g.everforest_background = "hard"
vim.g.everforest_enable_italic = 1
vim.g.tokyonight_style = "night"
vim.cmd('colorscheme gruvbox-material')

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
vim.wo.cursorline = true
vim.wo.colorcolumn = "120"

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.shiftround = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

vim.cmd('language en_US.utf-8')
vim.wo.list = true
vim.o.listchars = 'tab:┆·,trail:·,precedes:,extends:'
vim.g.termbufm_direction_cmd = 'new'

-- ale
vim.g.ale_linters_explicit = 1
vim.g.ale_linters = {
    sh = {'shellcheck'},
    javascript = {'eslint'},
    json = {'jq'}
}
vim.g.ale_fixers = {
    javascript = {'eslint'},
    json = {'jq'}
}
vim.g.ale_fix_on_save = 1

-- indentline
vim.g.indent_blankline_setColors = 0
vim.g.indent_blankline_defaultGroup = 'SpecialKey'
vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_filetype_exclude = {'help', 'fugitive', 'packer'}

-- nvim-tree
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
