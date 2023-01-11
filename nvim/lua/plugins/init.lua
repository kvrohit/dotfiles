return {
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
    event = "VeryLazy",
  },
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    config = function()
      require("better_escape").setup()
    end,
  },
}
