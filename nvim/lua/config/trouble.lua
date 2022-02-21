local M = {}

M.setup = function()
  require("trouble").setup({})

  -- keymaps
  local map_opts = { silent = true, noremap = true }
  vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", map_opts)
  vim.api.nvim_set_keymap(
    "n",
    "<leader>xn",
    "<cmd>lua require('trouble').next({skip_groups=true, jump=true})<cr>",
    map_opts
  )
  vim.api.nvim_set_keymap(
    "n",
    "<leader>xp",
    "<cmd>lua require('trouble').previous({skip_groups=true, jump=true})<cr>",
    map_opts
  )
  vim.api.nvim_set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", map_opts)
end

return M
