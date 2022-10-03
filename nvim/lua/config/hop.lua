local M = {}
local hop = require("hop")
local hop_hint = require("hop.hint")

M.setup = function()
  hop.setup()
  vim.keymap.set("n", "f", function()
    hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true })
  end)
  vim.keymap.set("n", "F", function()
    hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true })
  end)
  vim.keymap.set("o", "f", function()
    hop.hint_char1({ direction = hop_hint.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })
  end)
  vim.keymap.set("o", "F", function()
    hop.hint_char1({ direction = hop_hint.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })
  end)
end

return M
