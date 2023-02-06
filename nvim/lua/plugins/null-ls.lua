local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
}

M.setup = function(options)
  local nls = require("null-ls")
  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = {
      require("null-ls").builtins.formatting.stylua,
      require("null-ls").builtins.formatting.black,
      require("null-ls").builtins.formatting.prettierd.with({
        extra_filetypes = { "astro" },
      }),
      require("null-ls").builtins.formatting.rustfmt,
      require("null-ls").builtins.formatting.cljstyle,
      require("null-ls").builtins.formatting.xmllint,
      require("null-ls").builtins.formatting.beautysh,
      require("null-ls").builtins.diagnostics.eslint_d,
      require("null-ls").builtins.diagnostics.shellcheck,
    },
    on_attach = options.on_attach,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
  })
end

M.has_formatter = function(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
