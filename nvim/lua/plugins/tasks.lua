local M = {
  "kvrohit/tasks.nvim",
  ft = "task",
}

M.keys = {
  { "<leader>tt", "<cmd>ToggleTask<cr>", desc = "Toggle task" },
  { "<leader>tc", "<cmd>CancelTask<cr>", desc = "Mark task as cancelled" },
  { "<leader>td", "<cmd>UndoTask<cr>", desc = "Undo task" },
}

return M
