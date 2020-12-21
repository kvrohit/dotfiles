local opts = {noremap = true, silent = true}

-- normal mode re-map
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>;', ':Buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opts)

-- terminal mode re-map
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- auto commands
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
vim.cmd('autocmd TermOpen * setlocal nonu nornu')
