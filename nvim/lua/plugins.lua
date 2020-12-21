vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- packer
    use {'wbthomason/packer.nvim', opt = true}
    
    -- color schemes
    use 'glepnir/zephyr-nvim'
    use 'ulwlu/elly.vim'
    
    -- fzf
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- enhancements
    use 'nvim-treesitter/nvim-treesitter'
end)
