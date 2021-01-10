vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- packer
    use {'wbthomason/packer.nvim', opt = true}

    -- color schemes
    use 'sainnhe/edge'
    use 'sainnhe/sonokai'

    -- enhancements
    use {'nvim-treesitter/nvim-treesitter'}
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'tjdevries/express_line.nvim'}

    -- essentials
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'kvrohit/nvim-tasks'

    -- additional filetype support
    use 'evanleck/vim-svelte'

    -- linting
    use 'dense-analysis/ale'
end)
