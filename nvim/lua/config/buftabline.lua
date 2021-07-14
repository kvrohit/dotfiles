local M = {}

M.setup = function()
  require('buftabline').setup {
    index_format = "%d) ",
    icons = true,
    auto_hide = true,
    padding = 2,
    show_no_name_buffers = true,
  }
end

return M
