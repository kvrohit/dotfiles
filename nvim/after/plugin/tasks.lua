vim.keymap.set("n", "<leader>tt", require("task").toggle, { desc = "Toggle task/mark complete" })
vim.keymap.set("n", "<leader>td", require("task").undo, { desc = "Undo task" })
vim.keymap.set("n", "<leader>tc", require("task").cancel, { desc = "Cancel task" })
