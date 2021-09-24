local M = {}
local cmp = require('cmp')

M.setup = function()
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    },
    formatting = {
      format = function(entry, vim_item)
        local icons = require('config.lspkind').icons
        vim_item.kind = icons[vim_item.kind] .. vim_item.kind
        vim_item.menu = ({
          buffer = "[Buff]",
          nvim_lsp = "[LSP]",
          path = "[Path]",
          vsnip = "[Snip]",
          luasnip = "[Snip]",
          calc = "[Calc]",
        })[entry.source.name]
        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0
        return vim_item
      end,
    },
  }
end

return M
