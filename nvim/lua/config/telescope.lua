local M = {}

M.setup = function()
  require("telescope").setup {
    defaults = {
      winblend = 10,
      layout_strategy = "horizontal",
    },
    pickers = {
      find_files = {
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

  local map_opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').git_files()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<C-_>', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", map_opts)
end

return M
