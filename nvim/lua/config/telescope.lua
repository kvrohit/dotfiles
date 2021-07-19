local M = {}

M.setup = function()
  require("telescope").setup {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false
        },
        width = 0.90,
        height = 0.80,
        preview_cutoff = 120
      },
      winblend = 10,
    },
  }

  local map_opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').git_files()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", map_opts)
  vim.api.nvim_set_keymap('n', '<C-_>', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_config = {prompt_position='top'}, sorting_strategy='ascending'})<cr>", map_opts)
end

return M
