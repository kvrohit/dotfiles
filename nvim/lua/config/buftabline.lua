local M = {}

M.setup = function()
  require('buftabline').setup {
    tab_format = " #{n} #{b} #{i} ",
    icon_colors = false,
    hlgroups = {
      modified_current = "VisualMode",
      modified_normal = "Warnings",
      modified_active = "VisualMode",
    }
  }
end

return M
