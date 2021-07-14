local M = {}

M.setup = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
  }
end

return M
