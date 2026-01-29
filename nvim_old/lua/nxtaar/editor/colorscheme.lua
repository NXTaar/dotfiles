local function nordic_config(_, opts)
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

local M = {
    {
        'cryptomilk/nightcity.nvim',
        opts = {
            style = 'afterlife',
            on_highlights = function(groups, c)
                groups.String = { fg = c.white, bg = c.none }
                groups.LineNrAbove = { fg = c.xgray8 }
                groups.LineNrBelow = { fg = c.xgray8 }
                groups.LineNr = { fg = c.yellow }
            end
        },
        init = function()
            vim.cmd('colorscheme nightcity')
        end
    },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         bold_keywords = true,
    --         transparent_bg = false,
    --         cursorline = {
    --             bold = true
    --         }
    --     },
    --     config = nordic_config
    -- },
    {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        opts = {}
    }
}


return M
