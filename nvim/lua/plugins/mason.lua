local M = {
  "williamboman/mason.nvim",
}

M.dependencies = {
  { "williamboman/mason-lspconfig.nvim" },
}

M.servers = {
  "astro",
  "clangd",
  "rust_analyzer",
  "pyright",
  "tsserver",
  "sumneko_lua",
  "clojure_lsp",
  "bashls",
  "yamlls",
  "marksman",
  "html",
  "cssls",
}

M.config = function()
  require("mason").setup()

  -- Ensure the servers above are installed
  require("mason-lspconfig").setup({
    ensure_installed = M.servers,
  })
end

return M
