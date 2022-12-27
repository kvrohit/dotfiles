local M = {
  "kvrohit/mellow.nvim",
  lazy = false,
}

M.config = function ()
  vim.cmd [[colorscheme mellow]]
end

return M
