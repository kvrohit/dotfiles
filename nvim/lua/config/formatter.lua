local M = {}

M.setup = function()
  require('formatter').setup({
    logging = false,
    filetype = {
      javascript = {
        -- prettier
        function()
          return {
            exe = "npx",
            args = {"--no-install", "prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
    }
  })
end

return M
