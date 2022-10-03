local M = {}
local bufferline = require("bufferline")

M.setup = function()
  bufferline.setup({
    options = {
      numbers = "ordinal",
      always_show_bufferline = false,
      color_icons = false,
    },
  })

  vim.keymap.set("n", "<leader>1", function()
    bufferline.go_to_buffer(1, true)
  end, { desc = "Go to buffer 1" })
  vim.keymap.set("n", "<leader>2", function()
    bufferline.go_to_buffer(2, true)
  end, { desc = "Go to buffer 2" })
  vim.keymap.set("n", "<leader>3", function()
    bufferline.go_to_buffer(3, true)
  end, { desc = "Go to buffer 3" })
  vim.keymap.set("n", "<leader>4", function()
    bufferline.go_to_buffer(4, true)
  end, { desc = "Go to buffer 4" })
  vim.keymap.set("n", "<leader>5", function()
    bufferline.go_to_buffer(5, true)
  end, { desc = "Go to buffer 5" })
  vim.keymap.set("n", "<leader>6", function()
    bufferline.go_to_buffer(6, true)
  end, { desc = "Go to buffer 6" })
  vim.keymap.set("n", "<leader>7", function()
    bufferline.go_to_buffer(7, true)
  end, { desc = "Go to buffer 7" })
  vim.keymap.set("n", "<leader>8", function()
    bufferline.go_to_buffer(8, true)
  end, { desc = "Go to buffer 8" })
  vim.keymap.set("n", "<leader>9", function()
    bufferline.go_to_buffer(9, true)
  end, { desc = "Go to buffer 9" })
  vim.keymap.set("n", "<leader>$", function()
    bufferline.go_to_buffer(-1, true)
  end, { desc = "Go to buffer -1" })
end

return M
