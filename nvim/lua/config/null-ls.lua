local M = {}

M.setup = function()
  local null_ls = require("null-ls")
  local opts = {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.cljstyle,
      null_ls.builtins.formatting.xmllint,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.shellcheck,
    },
  }

  null_ls.setup(opts)
end

return M
