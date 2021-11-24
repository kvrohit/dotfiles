local M = {}
local vi_mode = require("feline.providers.vi_mode")

-- Substrata
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
  require("feline").setup({
    colors = colors,
    vi_mode_colors = vi_mode_colors,
    components = {
      active = {
        -- left
        {
          {
            provider = " ",
            hl = function()
              return {
                fg = vi_mode.get_mode_color(),
              }
            end,
          },
          {
            provider = "git_branch",
            hl = {
              fg = "light_gray",
            },
          },
        },
        -- center
        {},
        -- right
        {
          {
            provider = "lsp_client_names",
            hl = {
              fg = "gray",
            },
            icon = " ",
            right_sep = " ",
          },
          {
            provider = {
              name = "file_info",
              opts = {
                file_modified_icon = "",
                colored_icon = false,
              },
            },
            hl = {
              fg = "light_gray",
            },
            left_sep = " ",
            right_sep = " ",
          },
          {
            provider = "position",
            hl = {
              fg = "light_gray",
            },
            right_sep = " ",
          },
          {
            provider = "",
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
            provider = "",
            hl = {
              bg = "#191c25",
              fg = "black",
              style = "underline",
            },
          },
        },
      },
    },
  })
end

return M
