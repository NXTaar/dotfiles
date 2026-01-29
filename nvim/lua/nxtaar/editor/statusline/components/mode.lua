local Badge = require('nxtaar.editor.statusline.components.ui.badge')
local MacroRec = require('nxtaar.editor.statusline.components.macro_rec')
local component = require('nxtaar.editor.statusline.utils.component').component
local emitter = require('nxtaar.utils.event_emiiter')

local mode_and_recording_event = 'VimModeAndMacroRec'

local mode_changed_autocmd = {
    'ModeChanged',
    pattern = '*:*',
}

emitter:merge_autocmds(mode_and_recording_event, {
    'RecordingEnter',
    'RecordingLeave',
    mode_changed_autocmd,
})

return {
    static = {
        mode_idle_color = function(self)
            return self.state.mode.color.idle
        end,
    },
    component({
        init = function(self)
            local mode = self.state.mode.name
            local color = self.state.mode.color
            local icon = self.state.mode.icon

            return {
                Badge({
                    content = icon,
                    hl = color.active,
                    overlay = {
                        right = color.idle.bg,
                    },
                }, self),
                Badge({
                    content = ' ' .. mode,
                    hl = {
                        fg = color.idle.fg,
                        bg = color.idle.bg,
                        bold = true,
                    },
                    round = {
                        left = false,
                        right = false,
                    },
                }, self),
            }
        end,
        update = mode_changed_autocmd,
    }),
    {
        fallthrough = true,
        {
            condition = function(self)
                return self.state.macro_rec.is_recording
            end,
            provider = ' ',
            hl = function(self)
                return {
                    bg = self:mode_idle_color().bg,
                }
            end,
        },
        {
            condition = function(self)
                return not self.state.macro_rec.is_recording
            end,
            provider = '',
            hl = function(self)
                return {
                    fg = self:mode_idle_color().bg,
                }
            end,
        },
        update = emitter:user_event(mode_and_recording_event),
    },
    MacroRec,
}
