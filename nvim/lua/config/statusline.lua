local M = {}

M.setup = function()
  require('feline').setup {
    colors = {
      fg = "#b5b4c9",
      bg = "#20222d",
      black = "#20222d",
      green = "#76a065",
      cyan = "#659ea2",
      red = "#cf8164",
      magenta = "#a18daf",
      blue = "#8296b0",
      yellow = "#ab924c",
      white = "#f0ecfe",
      gray = "#5b5f71",
      light_gray = "#6c6f82",
    },
    components = {
      active = {
        {
          {
            provider = '▊ ',
            hl = {
              fg = 'gray',
            },
          },
          {
            provider = 'git_branch',
            hl = {
              fg = 'light_gray',
            },
          },
        },
        {
          {
            provider = 'file_info',
            hl = {
              fg = 'light_gray',
            },
            right_sep = 'right',
            colored_icon = false,
          },
          {
            provider = 'position',
            hl = {
              fg = 'light_gray',
            },
            right_sep = 'right',
          },
          {
            provider = 'scroll_bar',
            hl = {
              fg = 'gray',
            },
          },
        },
      },
      inactive = {
        {
          {
            provider = '',
            hl = {
              bg = '#191c25',
              fg = 'black',
              style = 'underline',
            },
          },
        },
      },
    },
  }
end

return M
