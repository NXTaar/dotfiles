local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local Pill = require('nxtaar.editor.statusline.components.ui.pill')

return {
    condition = conditions.is_git_repo,

    static = {
        git_hl = utils.get_highlight('DiagnosticVirtualTextWarn'),
    },

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
    end,

    Pill({
        icon = '',
        icon_color = '#000000',
        pill_color = function(self)
            return self.git_hl.fg
        end,
        content = function(self)
            return self.status_dict.head
        end,
        content_hl = function(self)
            return {
                fg = self.git_hl.fg,
                bg = self.git_hl.bg,
                bold = true,
            }
        end,
    }),
}
