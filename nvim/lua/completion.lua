require('compe').setup {
    enabled = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
    },
}

local opts = {noremap = true, silent = true, expr = true}
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', opts)
vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", opts)
vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", opts)
