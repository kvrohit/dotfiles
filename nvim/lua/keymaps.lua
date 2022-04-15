local opts = { noremap = true, silent = true }

-- general
vim.api.nvim_set_keymap("n", "<Leader>d", ":bd<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>s", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>qn", ":cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>qp", ":cprevious<CR>", opts)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fs", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>:w<CR>", opts)

-- sane up and down movements for word wrap
-- vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- nvim-tasks
vim.api.nvim_set_keymap("n", "<Leader>tt", ":ToggleTask<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>tc", ":CancelTask<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>td", ":UndoTask<CR>", opts)

-- hop
vim.api.nvim_set_keymap(
  "n",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "n",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "o",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "o",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
vim.api.nvim_set_keymap(
  "",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)

-- buffers
vim.api.nvim_set_keymap("n", "<Left>", ":BufPrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<Right>", ":BufNext<CR>", opts)

-- commands
vim.cmd([[command! Format execute 'lua vim.lsp.buf.formatting()']])
vim.cmd([[au TermOpen * setlocal nonu nornu]])
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]])
