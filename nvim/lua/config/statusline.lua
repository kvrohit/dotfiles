local M = {}
local feline = require("feline")
local mode_colors = {
  n = "StatusLineNormalMode",
  no = "StatusLineNormalMode",
  i = "StatusLineInsertMode",
  v = "StatusLineVisualMode",
  V = "StatusLineVisualMode",
  [""] = "StatusLine",
  r = "StatusLineReplaceMode",
  rm = "StatusLineReplaceMode",
  R = "StatusLineReplaceMode",
  Rv = "StatusLineReplaceMode",
  s = "StatusLineVisualMode",
  S = "StatusLineVisualMode",
  c = "StatusLineTerminalMode",
  ["!"] = "StatusLineReplaceMode",
  t = "StatusLineTerminalMode",
}

M.setup = function()
  feline.setup({
    components = {
      active = {
        -- left
        {
          {
            provider = " ",
            hl = function()
              return mode_colors[vim.fn.mode()]
            end,
            right_sep = { str = " ", hl = "StatusLine" },
          },
          {
            provider = "git_branch",
            hl = "StatusLine",
          },
          {
            provider = "",
            hl = "StatusLine",
          },
        },
        -- center
        {},
        -- right
        {
          {
            provider = "diagnostic_errors",
            hl = "StatusLineError",
          },
          {
            provider = "diagnostic_warnings",
            hl = "StatusLineWarn",
          },
          {
            provider = "diagnostic_hints",
            hl = "StatusLineHint",
          },
          {
            provider = "diagnostic_info",
            hl = "StatusLineInfo",
          },
          {
            provider = "lsp_client_names",
            hl = "StatusLineNC",
            icon = " ",
            left_sep = { str = "  ", hl = "StatusLine" },
          },
          {
            provider = {
              name = "file_info",
              opts = {
                file_modified_icon = "",
                colored_icon = false,
              },
            },
            hl = "StatusLine",
            left_sep = { str = "  ", hl = "StatusLine" },
            right_sep = { str = " ", hl = "StatusLine" },
          },
          {
            provider = " ",
            hl = function()
              return mode_colors[vim.fn.mode()]
            end,
          },
        },
      },
      inactive = {
        {
          {
            provider = "",
            hl = {
              bg = "StatusLine",
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
