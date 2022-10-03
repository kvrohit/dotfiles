local M = {}
local null_ls = require("null-ls")

M.setup = function()
  null_ls.setup({
    sources = {
      require("null-ls").builtins.formatting.stylua,
      require("null-ls").builtins.formatting.black,
      require("null-ls").builtins.formatting.prettierd.with({
        extra_filetypes = { "astro" },
      }),
      require("null-ls").builtins.formatting.rustfmt,
      require("null-ls").builtins.formatting.cljstyle,
      require("null-ls").builtins.formatting.xmllint,
      require("null-ls").builtins.diagnostics.eslint_d,
      require("null-ls").builtins.diagnostics.shellcheck,
      require("null-ls").builtins.diagnostics.yamllint,
    },
  })

  vim.keymap.set("n", "<leader><leader>s", function()
    vim.lsp.buf.formatting_sync(nil, 2000)
    vim.cmd([[w]])
  end)
end

return M
