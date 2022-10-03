local M = {}
local colorizer = require("colorizer")

M.setup = function()
  colorizer.setup({
    "*",
    css = { rgb = true, rgb_fn = true },
    scss = { rgb = true, rgb_fn = true },
  }, { names = false })
end

return M
