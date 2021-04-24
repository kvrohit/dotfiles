vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init {
	git = {
		clone_timeout = 120,
	}
}

return packer.startup(function()
    -- packer
    use {'wbthomason/packer.nvim', opt = true}

    -- color schemes
    use 'sainnhe/edge'
    use 'sainnhe/sonokai'
    use 'sainnhe/gruvbox-material'

    -- enhancements
    use {'nvim-treesitter/nvim-treesitter'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'famiu/feline.nvim'}
    use {'voldikss/vim-floaterm'}
    use {'jose-elias-alvarez/buftabline.nvim', config = function() require("buftabline").setup {} end}
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('gitsigns').setup() end}
    use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }}

    -- essentials
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'b3nj5m1n/kommentary'
    use 'kvrohit/nvim-tasks'
    use 'jiangmiao/auto-pairs'

    -- additional filetype support
    use 'evanleck/vim-svelte'
    use 'mechatroner/rainbow_csv'

    -- linting
    use 'dense-analysis/ale'
end)
