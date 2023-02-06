return {
  -- dir = "/Users/rohit/play/neovim/mellow.nvim",
  -- dev = true,
  "kvrohit/mellow.nvim",
  lazy = false,
  config = function()
    vim.cmd([[colorscheme mellow]])
  end,
}
