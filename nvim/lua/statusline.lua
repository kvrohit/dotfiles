-- gruvbox-material
--[[ local colors = {
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
    yellow = '#c18f41',
    fg = '#d4be98',
    bg = '#32302f',
} ]]

-- edge: aura
local colors = {
    bg = '#2b2d37',
    fg = none,
    yellow = '#deb974',
    cyan = '#5dbbc1',
    green = '#a0c980',
    magenta = '#d38aea',
    blue = '#6cb6eb';
    red = '#ec7279',
    black = '#363a49',
}

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.magenta,
    ['V-REPLACE'] = colors.magenta,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.yellow,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}

local function file_osinfo()
    local os = vim.bo.fileformat:lower()
    return os
end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local comps = {
    vi_mode = {
        left = {
            provider = '▉',
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color()
                }
                return val
            end,
            right_sep = {
                str = ' ',
                hl = {
                    bg = colors.black,
                    fg = none
                }
            }
        },
        right = {
            provider = '▉',
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color(),
                    bg = colors.black,
                }
                return val
            end,
        }
    },
    file = {
        info = {
            provider = 'file_info',
            hl = {
                bg = colors.black,
                style = 'bold'
            },
            right_sep = 'right_filled'
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.magenta,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = colors.yellow,
                style = 'bold'
            },
            right_sep = ' '
        }
    },
    line_percentage = {
        provider = 'line_percentage',
        left_sep = {'left_filled', 'block'},
        hl = {
            bg = colors.black,
            style = 'bold'
        },
        right_sep = {'block'}
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
    diagnos = {
        err = {
            provider = 'diagnostic_errors',
            enabled = function()
                return lsp.diagnostics_exist('Error')
            end,
            hl = {
                fg = colors.red
            }
        },
        warn = {
            provider = 'diagnostic_warnings',
            enabled = function()
                return lsp.diagnostics_exist('Warning')
            end,
            hl = {
                fg = colors.yellow
            }
        },
        hint = {
            provider = 'diagnostic_hints',
            enabled = function()
                return lsp.diagnostics_exist('Hint')
            end,
            hl = {
                fg = colors.cyan
            }
        },
        info = {
            provider = 'diagnostic_info',
            enabled = function()
                return lsp.diagnostics_exist('Information')
            end,
            hl = {
                fg = colors.blue
            }
        },
    },
    lsp = {
        name = {
            provider = 'lsp_client_names',
            left_sep = ' ',
            icon = ' ',
            hl = {
                fg = colors.yellow
            }
        }
    },
    git = {
        branch = {
            provider = 'git_branch',
            enabled = function() return vim.b.gitsigns_status_dict ~= nil end,
            icon = ' ',
            left_sep = {'left_filled', {str = ' ', hl = { bg = colors.black }}},
            hl = {
                fg = colors.fg,
                bg = colors.black,
                style = 'bold'
            },
            right_sep = {{str = ' ', hl = { bg = colors.black }}, 'right_filled'},
        },
        add = {
            provider = 'git_diff_added',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = 'git_diff_changed',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.yellow
            }
        },
        remove = {
            provider = 'git_diff_removed',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.red
            },
            right_sep = ' '
        }
    }
}

local properties = {
    force_inactive = {
        filetypes = {
            'NvimTree',
            'dbui',
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {
            comps.vi_mode.left,
            comps.file.info,
            comps.lsp.name,
            comps.diagnos.err,
            comps.diagnos.warn,
            comps.diagnos.hint,
            comps.diagnos.info
        },
        inactive = {
            comps.vi_mode.left,
            comps.file.info
        }
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {
            comps.git.add,
            comps.git.change,
            comps.git.remove,
            comps.git.branch,
            comps.file.os,
            comps.line_percentage,
            comps.vi_mode.right
        },
        inactive = {}
    }
}

require'feline'.setup {
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
}
