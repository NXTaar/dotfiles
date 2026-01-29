local conditions = require('heirline.conditions')
local Pill = require('nxtaar.editor.statusline.components.ui.pill')
local Color = require('nxtaar.utils.color')

local base_color = Color.from_hl_group('WarningMsg', 'fg')
local base_color_rgb = base_color:to_rgb()

local icon_bg = base_color_rgb
local icon_color = '#000000'
local content_fg = base_color_rgb
local content_bg = base_color:shade(0.75):to_rgb()

return {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
    end,

    Pill({
        icon = '',
        icon_color = icon_color,
        pill_color = icon_bg,
        content = function(self)
            return self.status_dict.head
        end,
        content_hl = {
            fg = content_fg,
            bg = content_bg,
            bold = true,
        },
    }),
}
