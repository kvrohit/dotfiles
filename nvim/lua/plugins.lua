local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init({
  git = {
    clone_timeout = 120,
  },
})

local plugins = {
  -- packer
  { "wbthomason/packer.nvim" },
  -- color schemes
  { "/Users/rohit/play/neovim/substrata.nvim" },
  { "rafamadriz/neon" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },
  { "rebelot/kanagawa.nvim" },
  { "/Users/rohit/play/neovim/rasmus.nvim" },
  -- enhancements
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("config.telescope").setup()
    end,
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("config.lsp").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.trouble").setup()
    end,
  },
  -- completion
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.cmp").setup()
    end,
  },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("config.tabout").setup()
    end,
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.treesitter").setup()
    end,
  },
  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("config.toggleterm").setup()
    end,
  },
  {
    "jose-elias-alvarez/buftabline.nvim",
    config = function()
      require("config.buftabline").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30,
        },
      })
      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "famiu/feline.nvim",
    config = function()
      require("config.statusline").setup()
    end,
  },
  -- essentials
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-sleuth" },
  { "kvrohit/tasks.nvim" },
  {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("config.autopairs").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  { "fladson/vim-kitty" },
  { "b0o/schemastore.nvim" },
  { "Olical/conjure" },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  {
    "eraserhd/parinfer-rust",
    run = "cargo build --release",
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  },
}

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
