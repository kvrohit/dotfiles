local M = {}
local neotree = require("neo-tree")

M.setup = function()
  neotree.setup()
  vim.keymap.set("n", "\\", ":NeoTreeReveal<cr>")
end

return M
