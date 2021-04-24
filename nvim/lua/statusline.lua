local colors = {
    black = '#3c3836',
    skyblue = '#68948a',
    cyan = '#72966c',
    green = '#8f9a52',
    oceanblue = '#5a524c',
    magenta = '#ab6c7d',
    orange = '#d65c0d',
    red = '#b85651',
    violet = '#7daea3',
    white = '#ddc7a1',
    yellow = '#c18f41'
}

local vi_mode_colors = {
    NORMAL = colors.green,
    OP = colors.green,
    INSERT = colors.red,
    VISUAL = colors.skyblue,
    BLOCK = colors.skyblue,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow,
}

local separators = {
    vertical_bar_thin = '',
}

require('feline').setup({
    preset = 'noicon',
    default_fg = '#d4be98',
    default_bg = '#32302f',
    colors = colors,
    separators = separators,
    vi_mode_colors = vi_mode_colors,
})
