local Badge = require('nxtaar.editor.statusline.components.ui.badge')
local component = require('nxtaar.editor.statusline.utils.component').component
local redraw = require('nxtaar.editor.statusline.utils.redraw')
local Git = require('nxtaar.utils.git')
local Color = require('nxtaar.utils.color')

local base_color = Color.from_hl_group('Directory', 'fg')
local base_color_rgb = base_color:to_rgb()

local icon_bg = base_color_rgb
local icon_color = '#000000'
local content_fg = base_color_rgb
local content_bg = base_color:shade(0.75):to_rgb()

return component({
    condition = function()
        return Git.get_repo_name(vim.api.nvim_buf_get_name(0))
    end,

    init = function(self)
        local repo = Git.get_repo_name(vim.api.nvim_buf_get_name(0))

        return {
            Badge({
                content = '',
                hl = { bg = icon_bg, fg = icon_color },
                overlay = {
                    right = content_bg,
                },
            }, self),
            Badge({
                content = ' ' .. repo,
                hl = {
                    fg = content_fg,
                    bg = content_bg,
                    bold = true,
                },
                round = {
                    left = false,
                },
            }, self),
        }
    end,

    update = {
        'BufEnter',
        'BufWritePost',
        'BufFilePost',
        'BufNewFile',
        callback = redraw,
    },
})
