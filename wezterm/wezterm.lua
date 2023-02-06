local wezterm = require("wezterm")

-- Tab colors from the Mellow theme
local colors = {
  bg = "#161617",
  fg = "#c9c7cd",
  gray01 = "#1b1b1d",
  gray02 = "#2a2a2d",
  gray03 = "#3e3e43",
  gray04 = "#57575f",
  gray05 = "#757581",
  gray06 = "#9998a8",
  gray07 = "#c1c0d4",
}

local tab_bar_colors = {
  background = colors.bg,
  active_tab = {
    bg_color = colors.bg,
    fg_color = colors.fg,
  },
  inactive_tab = {
    bg_color = colors.gray02,
    fg_color = colors.fg,
  },
  inactive_tab_hover = {
    bg_color = colors.gray03,
    fg_color = colors.fg,
  },
  new_tab = {
    bg_color = colors.gray02,
    fg_color = colors.fg,
  },
  new_tab_hover = {
    bg_color = colors.gray03,
    fg_color = colors.fg,
  },
}

return {
  font_size = 18.0,
  line_height = 1.0,
  font = wezterm.font_with_fallback({
    { family = "Iosevka Fixed", weight = "Regular" },
    "Symbols Nerd Font",
  }),
  -- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  harfbuzz_features = { "ss01", "ss20" },
  -- harfbuzz_features = { "clig=0", "diag=1" },
  colors = {
    tab_bar = tab_bar_colors,
  },
  color_scheme = "mellow",
  exit_behavior = "Close",
  --  tab_max_width = 24,
  hide_tab_bar_if_only_one_tab = true,
  --  use_fancy_tab_bar = false,
  window_frame = {
    font = wezterm.font { family = "Cascadia Code PL" },
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
