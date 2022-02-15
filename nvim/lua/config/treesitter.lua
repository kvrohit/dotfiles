local M = {}

M.setup = function()
  local opts = {
    ensure_installed = "maintained",
    highlight = { enable = true },
    autotag = {
      enable = true,
    },
  }

  require("nvim-treesitter.configs").setup(opts)
end

return M
