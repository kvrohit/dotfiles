-- package manager and plugins
require "paq" {
    {"savq/paq-nvim"},
    
    -- colorscheme
    {"arzg/vim-substrata"},
    {"folke/lsp-colors.nvim"},
    
    -- icons
    {"kyazdani42/nvim-web-devicons"},

    -- statusline
    {"tamton-aquib/staline.nvim"},

    -- tabline
    {"akinsho/nvim-bufferline.lua"},
    
    -- lsp
    {"neovim/nvim-lspconfig"},
    {"glepnir/lspsaga.nvim"},
    {"onsails/lspkind-nvim"},
    {"ray-x/lsp_signature.nvim"},
    
    -- completion
    {"hrsh7th/nvim-compe"},
    {"nvim-treesitter/nvim-treesitter"},
    {"norcalli/nvim-colorizer.lua"},
    {"kyazdani42/nvim-tree.lua"},

    -- telescope
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},

    -- essentials
    {'tpope/vim-repeat'},
    {'tpope/vim-surround'},
    {'tpope/vim-fugitive'},
    {'b3nj5m1n/kommentary'},
    {'kvrohit/nvim-tasks'},
    {'windwp/nvim-autopairs'},
    {'lewis6991/gitsigns.nvim'},
    {'akinsho/nvim-toggleterm.lua'},
    {'mhartington/formatter.nvim'},
}

require("options")
require("keymaps")
require("lsp")
require("completion")
require("treesitter")
require("tscope")
require("toggleterm").setup {
    open_mapping = [[<F12>]],
    direction = "float",
    float_opts = {
        border = "single",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}
require("staline").setup {
    mode_colors = {
		n = "#659ea2",
		i = "#a18daf",
		c = "#ab924c",
		v = "#8296b0",
		V = "#8296b0",
	},
}
require("bufferline").setup()
require("gitsigns").setup()
require("colorizer").setup()
require("nvim-autopairs").setup()
require("format")
require('lspkind').init()
