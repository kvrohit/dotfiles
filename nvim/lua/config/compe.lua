local M = {}

M.setup = function()
  require('compe').setup {
      enabled = true,
      preselect = 'always',
      documentation = true,
      source = {
          path = true,
          buffer = true,
          calc = true,
          nvim_lsp = true,
          nvim_lua = true,
          spell = true,
          tags = true,
          treesitter = true,
      },
  }

  local map_opts = {noremap = true, silent = true, expr = true}
  vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', map_opts)
  -- vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", opts)
  vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", map_opts)
end

return M
