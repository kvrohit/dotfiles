local opts = {noremap = true, silent = true}

-- general
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', opts)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)

-- vim-commentary
vim.api.nvim_set_keymap('', 'gc', ':Commentary<CR>', opts)

-- nvim-tasks
vim.api.nvim_set_keymap('n', '<Leader>tt', ':ToggleTask<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>td', ':UndoTask<CR>', opts)

-- auto commands
vim.cmd('autocmd TermOpen * setlocal nonu nornu')
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')
