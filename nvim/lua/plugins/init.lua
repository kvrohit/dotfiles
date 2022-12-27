return {
  "folke/which-key.nvim",
  {
    "tpope/vim-sleuth",
    event = "BufReadPre",
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "Olical/conjure",
    ft = "clojure",
  },
  {
    "eraserhd/parinfer-rust",
    build = "cargo build --release",
    event = "BufReadPost",
  },
}
