local wezterm = require("wezterm")

-- Tab colors from the Substrata theme
local colors = {
  fg = "#b5b4c9",
  fg1 = "#f0ecfe",
  bg0 = "#191c25",
  bg1 = "#20222d",
  bg2 = "#272935",
  bg3 = "#2e313d",
  bg4 = "#3c3f4e",
}

local tab_bar_colors = {
  background = colors.bg0,
  active_tab = {
    bg_color = colors.bg3,
    fg_color = colors.fg,
  },
  inactive_tab = {
    bg_color = colors.bg1,
    fg_color = colors.fg,
  },
  inactive_tab_hover = {
    bg_color = colors.bg4,
    fg_color = colors.fg,
  },
  new_tab = {
    bg_color = colors.bg1,
    fg_color = colors.fg,
  },
  new_tab_hover = {
    bg_color = colors.bg4,
    fg_color = colors.fg,
  },
}

return {
  window_decorations = "RESIZE",
  default_prog = { "/usr/local/bin/fish", "-l" },
  font_size = 16.0,
  -- line_height = 1.2,
  hide_tab_bar_if_only_one_tab = true,
  exit_behavior = "Close",
  font = wezterm.font_with_fallback({
    { family = "Cartograph CF", weight = "Regular" },
    "CartographCF Nerd Font",
  }),
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  -- harfbuzz_features = {"ss01"},
  colors = {
    tab_bar = tab_bar_colors,
  },
  color_scheme = "Substrata",
  tab_max_width = 24,
}
