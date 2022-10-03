local M = {}
local wk = require("which-key")

M.setup = function()
  wk.register({
    ["<leader>"] = {
      e = {
        name = "+eval",
        e = "Eval form",
        r = "Eval root form",
        w = "Eval word",
        ce = "Eval form & display result as a comment",
        cr = "Eval root form & display result as a comment",
        cw = "Eval word & display result as a comment",
        ["!"] = "Eval form & replace it with the result",
      },
      f = {
        name = "+file",
        f = "Find file",
        b = "Find buffer",
        g = "Grep string",
        s = "Document symbols",
        t = "Find tag",
        n = { "<cmd>enew<cr>", "New file" },
      },
      t = {
        name = "+task",
        t = "Create task/mark complete",
        c = "Cancel task",
        d = "Undo task",
      },
      s = "Save",
      d = {
        name = "+diagnostics",
        f = "Show diagnostics in popup",
        q = "All diagnostics to location list",
      },
      ["<leader>"] = {
        s = "Format and save",
      },
    },
    ["g"] = {
      D = "Go to declaration",
      d = "Go to definition",
      i = "Go to implementation",
      r = "Go to reference",
    },
  })
end

return M
