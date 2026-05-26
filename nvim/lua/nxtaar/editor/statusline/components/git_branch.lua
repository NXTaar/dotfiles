local Badge = require('nxtaar.editor.statusline.components.ui.badge')
local component = require('nxtaar.editor.statusline.utils.component').component
local conditions = require('heirline.conditions')
local Color = require('nxtaar.utils.color')

local base_color = Color.from_hl_group('WarningMsg', 'fg')
local base_color_rgb = base_color:to_rgb()

local icon_bg = base_color_rgb
local icon_color = '#000000'
local content_fg = base_color_rgb
local content_bg = base_color:shade(0.75):to_rgb()

return component({
    condition = conditions.is_git_repo,

    init = function(self)
        local status = vim.b.gitsigns_status_dict
        return {
            Badge({
                content = '',
                hl = { bg = icon_bg, fg = icon_color },
                overlay = {
                    right = content_bg,
                },
            }, self),
            Badge({
                content = ' ' .. status.head,
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
        'BufFilePost',
        'BufNewFile',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
})
