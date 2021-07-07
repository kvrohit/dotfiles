vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init {
	git = {
		clone_timeout = 120,
	},
}

local plugins = {
    -- packer
    {'wbthomason/packer.nvim', opt = true},

    -- color schemes
    {'sainnhe/edge'},
    {'sainnhe/sonokai'},
    {'sainnhe/gruvbox-material'},
    {'arzg/vim-substrata'},

    -- enhancements
    {'nvim-treesitter/nvim-treesitter'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/nvim-compe'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {
        'akinsho/nvim-toggleterm.lua',
        config = function()
            require('toggleterm').setup {
                direction = 'float'
            }
        end
    },
    {
        'jose-elias-alvarez/buftabline.nvim',
        config = function()
            require('buftabline').setup {}
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua'
    },
    {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'hoob3rt/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'iceberg_dark'
                }
            }
        end
    },
    {
        'prettier/vim-prettier',
        run = 'yarn install'
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },

    -- essentials
    {'tpope/vim-repeat'},
    {'tpope/vim-surround'},
    {'tpope/vim-fugitive'},
    {'b3nj5m1n/kommentary'},
    {'kvrohit/nvim-tasks'},
    {'jiangmiao/auto-pairs'},

    -- additional filetype support
    {'evanleck/vim-svelte'},
    {'mechatroner/rainbow_csv'},

    -- linting
    {'dense-analysis/ale'},
    -- use {'mfussenegger/nvim-lint', config = function() require('lint').linters_by_ft = {sh = {'shellcheck',}} end}
}

return packer.startup(function(use)
    for _, v in pairs(plugins) do
        use(v)
    end
end)
