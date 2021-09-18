local M = {}
local vi_mode = require('feline.providers.vi_mode');

local colors = {
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
}

local vi_mode_colors = {
  NORMAL = colors.gray,
  INSERT = colors.magenta,
  VISUAL = colors.cyan,
  LINES = colors.cyan,
  BLOCK = colors.cyan,
  COMMAND = colors.yellow,
}

M.setup = function()
  require('feline').setup {
    colors = colors,
    vi_mode_colors = vi_mode_colors,
    components = {
      active = {
        {
          {
            provider = '▋ ',
            hl = function() 
              return {
                fg = vi_mode.get_mode_color(),
              }
            end
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
            file_modified_icon = 'Δ',
          },
          {
            provider = 'position',
            hl = {
              fg = 'light_gray',
            },
            right_sep = 'right',
          },
          {
            provider = '▐',
            hl = function()
              return {
                fg = vi_mode.get_mode_color(),
              }
            end,
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
