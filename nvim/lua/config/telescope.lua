local M = {}

M.setup = function()
  local opts = {
    defaults = {
      winblend = 10,
      layout_strategy = "horizontal",
    },
    pickers = {
      find_files = {
        hidden = true,
        theme = "ivy",
      },
      git_files = {
        theme = "ivy",
      },
      current_buffer_fuzzy_find = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
    },
  }

  local map_opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>lua require('config.telescope').project_files()<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", map_opts)
  vim.api.nvim_set_keymap("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", map_opts)
  vim.api.nvim_set_keymap(
    "n",
    "<C-_>",
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
    map_opts
  )

  require("telescope").setup(opts)
end

M.project_files = function()
  local ok = pcall(require("telescope.builtin").git_files)
  if not ok then
    require("telescope.builtin").find_files()
  end
end

return M
