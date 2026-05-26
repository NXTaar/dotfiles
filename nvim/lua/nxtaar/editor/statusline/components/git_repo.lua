local Pill = require('nxtaar.editor.statusline.components.ui.pill')
local Git = require('nxtaar.utils.git')
local Color = require('nxtaar.utils.color')

local base_color = Color.from_hl_group('Directory', 'fg')
local base_color_rgb = base_color:to_rgb()

local icon_bg = base_color_rgb
local icon_color = '#000000'
local content_fg = base_color_rgb
local content_bg = base_color:shade(0.75):to_rgb()

return {
    -- Check if we're in a git repo without using heirline.conditions
    condition = function()
        return Git.get_repo_name(vim.api.nvim_buf_get_name(0))
    end,

    -- Initialize component
    init = function(self)
        self.git_repo_name = Git.get_repo_name(vim.api.nvim_buf_get_name(0))
    end,

    -- Use Pill component for styling
    Pill({
        icon = '',
        icon_color = icon_color,
        pill_color = icon_bg,
        content = function(self)
            return self.git_repo_name
        end,
        content_hl = {
            fg = content_fg,
            bg = content_bg,
            bold = true,
        },
    }),

    -- Update on relevant events
    update = {
        'BufEnter',
        'BufWritePost',
        'BufFilePost',
        'BufNewFile',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
}
