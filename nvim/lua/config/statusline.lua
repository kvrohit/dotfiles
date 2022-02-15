local M = {}
local vi_mode = require("feline.providers.vi_mode")

-- Substrata color theme
local substrata = {
  fg = "#b5b4c9",
  bg = "#20222d",
  bg2 = "#272935",
  bg3 = "#2e313d",
  bg4 = "#3c3f4e",
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
  NORMAL = substrata.bg4,
  OP = substrata.bg4,
  INSERT = substrata.light_gray,
  VISUAL = substrata.blue,
  LINES = substrata.blue,
  BLOCK = substrata.blue,
  REPLACE = substrata.red,
  COMMAND = substrata.bg3,
}

M.setup = function()
  local opts = {
    theme = substrata,
    vi_mode_colors = vi_mode_colors,
    components = {
      active = {
        -- left
        {
          {
            provider = "█ ",
            hl = function()
              return {
                fg = vi_mode.get_mode_color(),
              }
            end,
          },
          {
            provider = "git_branch",
            hl = { fg = "light_gray" },
          },
        },
        -- center
        {},
        -- right
        {
          {
            provider = "diagnostic_errors",
            hl = { fg = "red" },
          },
          {
            provider = "diagnostic_warnings",
            hl = { fg = "yellow" },
          },
          {
            provider = "diagnostic_hints",
            hl = { fg = "cyan" },
          },
          {
            provider = "diagnostic_info",
            hl = { fg = "blue" },
          },
          {
            provider = "lsp_client_names",
            hl = { fg = "magenta" },
            icon = " ",
            left_sep = "  ",
          },
          {
            provider = {
              name = "file_info",
              opts = {
                file_modified_icon = "",
                colored_icon = false,
              },
            },
            hl = { fg = "blue" },
            left_sep = "  ",
            right_sep = "  ",
          },
          {
            provider = "position",
            padding = true,
            hl = { fg = "fg" },
            right_sep = " ",
          },
          {
            provider = "█",
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
  }

  require("feline").setup(opts)
end

return M
