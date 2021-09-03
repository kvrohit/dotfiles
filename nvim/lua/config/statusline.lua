local M = {}

M.setup = function()
  require('staline').setup {
    defaults = {
      line_column = " %04l/%04L 並%P% ",
    },
    mode_colors = {
      n = "#8296b0",
      i = "#a18daf",
      ic= "#a18daf",
      c = "#ab924c",
      v = "#659ea2",
      V = "#659ea2",
    },
    mode_icons = {
      n = "N",
      i = "I",
      ic= "I",
      c = "C",
      v = "V",
      t = "T",
      V = "V",
    },
    sections = {
      left = {'-mode', 'left_sep_double', 'branch', ' ', 'lsp'},
      mid = {},
      right = {'file_name', 'right_sep_double', '-line_column'},
    },
  }
end

return M
