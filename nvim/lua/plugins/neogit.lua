return {
  "TimUntersberger/neogit",
  cmd = "Neogit",
  opts = {
    kind = "split",
    signs = {
      -- { CLOSED, OPENED }
      section = { "+", "-" },
      item = { "+", "-" },
      hunk = { "", "" },
    },
    integrations = { diffview = true },
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
  },
}
