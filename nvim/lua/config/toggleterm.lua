local M = {}

M.setup = function()
  local opts = {
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
  }

  require("toggleterm").setup(opts)
end

return M
