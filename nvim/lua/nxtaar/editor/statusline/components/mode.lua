local Pill = require('nxtaar.editor.statusline.components.ui.pill')
return {
    init = function(self)
        self.mode = self.consts.mode.nvim_mode_2_mode_name_map[vim.fn.mode(1)]
    end,
    Pill({
        icon = function(ctx)
            return ctx.consts.mode.modes[ctx.mode].icon
        end,
        content = function(ctx)
            return ctx.mode
        end,
        pill_color = function(self)
            local color = self:mode_color(self.mode)
            return color.active.bg
        end,
        icon_color = function(self)
            local color = self:mode_color(self.mode)
            return color.active.fg
        end,
        content_hl = function(self)
            local color = self:mode_color(self.mode)
            return {
                bold = true,
                bg = color.idle.bg,
                fg = color.idle.fg,
            }
        end,
    }),
    update = {
        'ModeChanged',
        pattern = '*:*',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
}
