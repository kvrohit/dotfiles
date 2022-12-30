local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

M.config = function()
  require("gitsigns").setup()
end

return M
