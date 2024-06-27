local M = {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        bold_keywords = true,
        transparent_bg = true,
        cursorline = {
            bold = true
        }
    }
}

function M.config(_, opts)
    local theme = require('nordic')
    local palette = require('nordic.colors')

    opts.override = {
        Comment = {
            fg = '#96A4B5',
        },
        LineNr = {
            fg = palette.yellow.dim
        },
        LspInlayHint = {
            fg = '#60728a',
            italic = true
        },
        LineNrAbove = {
            fg = '#96A4B5',
        },
        LineNrBelow = {
            fg = '#96A4B5',
        }

    }

    theme.setup(opts)
    theme.load()
end

return M
