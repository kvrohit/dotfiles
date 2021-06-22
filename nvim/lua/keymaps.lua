local opts = {noremap = true, silent = true}

-- general
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', opts)
vim.api.nvim_set_keymap('n', '<Leader>qn', ':cnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>qp', ':cprevious<CR>', opts)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', '<CMD>lua require\'telescope-config\'.project_files()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)

-- nvim-tasks
vim.api.nvim_set_keymap('n', '<Leader>tt', ':ToggleTask<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>td', ':UndoTask<CR>', opts)

-- float term
vim.api.nvim_set_keymap('n', '<F12>', ':ToggleTerm<CR>', opts)
vim.api.nvim_set_keymap('t', '<F12>', '<C-\\><C-n>:ToggleTerm<CR>', opts)

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeFindFile<CR>', opts)

-- auto commands
vim.cmd [[autocmd TermOpen * setlocal nonu nornu]]
vim.cmd [[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]
