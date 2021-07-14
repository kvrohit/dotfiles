local M = {}

M.setup = function()
  require('lspsaga').init_lsp_saga()

  local map_opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', map_opts)
  vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', map_opts)
  vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', '[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', map_opts)
  vim.api.nvim_set_keymap('n', ']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', map_opts)
end

return M
