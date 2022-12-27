return function(use)
  -- Conversational software development for neovim
  use({
    "Olical/conjure"
  })

  -- Formatting
  use({
    "jose-elias-alvarez/null-ls.nvim"
  })

  -- Parinfer
  use({
    "eraserhd/parinfer-rust",
    run = "cargo build --release"
  })

  -- Better escape
  use({
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end
  })

  -- Preview markdown while editing
  use({
    "toppair/peek.nvim",
    run = "deno task --quiet build:fast"
  })

  -- Spawn floating terminal windows
  use({
    "akinsho/toggleterm.nvim", tag = "*"
  })

  -- Auto pairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })

  -- Helpful dialog showing keymaps
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })

  -- hop anywhere
  use({
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  })

  -- Plugin to manage todos
  use({
    "kvrohit/tasks.nvim"
  })

  -- Colortheme: mellow
  use({
    -- "kvrohit/mellow.nvim"
    "/Users/rohit/play/neovim/mellow.nvim"
  })
end
