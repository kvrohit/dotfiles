local M = {}
local toggleterm = require("toggleterm")

M.setup = function()
  toggleterm.setup({
    open_mapping = [[<F12>]],
    direction = "float",
    float_opts = {
      border = "single",
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })
end

return M
