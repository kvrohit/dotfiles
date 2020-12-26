local opts = {noremap = true, silent = true}

-- normal mode re-map
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>;', ':Buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', opts)

-- vim-commentary
vim.api.nvim_set_keymap('', 'gc', ':Commentary<CR>', opts)

-- nvim-tasks
vim.api.nvim_set_keymap('n', '<Leader>tt', ':ToggleTask<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>td', ':UndoTask<CR>', opts)

-- auto commands
vim.cmd('autocmd TermOpen * setlocal nonu nornu')
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')
