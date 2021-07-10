require('lspsaga').init_lsp_saga()

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- lsp signature
  require "lsp_signature".on_attach({
      bind = false,
      use_lspsaga = true,
  });
end

-- language servers
local servers = { "pyright", "rust_analyzer", "bashls", "cssls", "html", "tsserver", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- mappings
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', opts)
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
