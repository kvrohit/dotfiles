local M = {}
local telescope = require("telescope")
local builtin = require("telescope.builtin")

M.setup = function()
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
  })
  vim.keymap.set("n", "<leader>ff", function()
    local ok = pcall(builtin.git_files)
    if not ok then
      builtin.find_files()
    end
  end)
  vim.keymap.set("n", "<leader>fb", builtin.buffers)
  vim.keymap.set("n", "<leader>ft", builtin.tags)
  vim.keymap.set("n", "<leader>fg", function()
    vim.ui.input({ prompt = "Enter search term > " }, function(value)
      builtin.grep_string({ search = value })
    end)
  end)
end

return M
