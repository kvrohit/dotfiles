local M = {}

M.setup = function()
  require('staline').setup {
    defaults = {
      line_column = " %04l/%04L 並%P% ",
      filename_section = "right",
    },
    mode_colors = {
      n = "#8296b0",
      i = "#a18daf",
      c = "#ab924c",
      v = "#659ea2",
      V = "#659ea2",
    },
    mode_icons = {
      n = "N",
      i = "I",
      c = "C",
      v = "V",
      t = "T",
      V = "V",
    },
  }
end

return M
