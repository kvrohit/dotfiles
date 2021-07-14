local M = {}

M.setup = function()
  local nvim_lsp = require('lspconfig')
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    require('lsp_signature').on_attach({
        bind = false,
        use_lspsaga = true,
    });
  end

  -- language servers
  local servers = { "pyright", "rust_analyzer", "bashls", "cssls", "html", "tsserver", "yamlls" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end
end

return M
