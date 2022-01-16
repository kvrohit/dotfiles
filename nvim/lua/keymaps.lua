local opts = { noremap = true, silent = true }

-- general
vim.api.nvim_set_keymap("n", "<Leader>d", ":bd<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>s", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>qn", ":cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>qp", ":cprevious<CR>", opts)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fs", ":FormatWrite<CR>", opts)

-- nvim-tasks
vim.api.nvim_set_keymap("n", "<Leader>tt", ":ToggleTask<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>tc", ":CancelTask<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>td", ":UndoTask<CR>", opts)

-- nvim-tree
vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>ft", ":NvimTreeFindFile<CR>", opts)

-- buffers
vim.api.nvim_set_keymap("n", "<Left>", ":BufPrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<Right>", ":BufNext<CR>", opts)

-- auto commands
vim.cmd([[autocmd TermOpen * setlocal nonu nornu]])
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]])
