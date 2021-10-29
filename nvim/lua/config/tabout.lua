local M = {}

M.setup = function()
  local pairs = { "''", '""', "``", "()", "{}", "[]" }
  local opts = {
    tabkey = "<C-l>", -- key to trigger tabout
    backwards_tabkey = "<C-S-l>", -- key to trigger tabout
    act_as_tab = true, -- shift content if tab out is not possible
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {},
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {}, -- tabout will ignore these filetypes
  }
  for i, v in ipairs(pairs) do
    opts.tabouts = vim.list_extend(opts.tabouts, { { open = v:sub(1, 1), close = v:sub(2) } })
  end

  require("tabout").setup(opts)
end

return M
