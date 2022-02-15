local M = {}

M.setup = function()
  local opts = {
    tab_format = " #{n}> #{b} ",
    icon_colors = false,
    hlgroups = {
      modified_current = "VisualMode",
      modified_normal = "Warnings",
      modified_active = "VisualMode",
    },
  }

  require("buftabline").setup(opts)
end

return M
