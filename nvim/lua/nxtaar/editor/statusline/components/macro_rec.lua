local Animation = require('animation')
local easing = require('animation.easing')
local emitter = require('nxtaar.utils.event_emiiter')
local Badge = require('nxtaar.editor.statusline.components.ui.badge')
local component = require('nxtaar.editor.statusline.utils.component').component
local Color = require('nxtaar.utils.color')

local animation_event = 'RecordingAnimationUpdate'
local macro_rec_redraw = 'MacroRecRedraw'

local record_color = Color.from_hl_group('Error', 'fg')
local record_color_rgb = record_color:to_rgb()
local record_hl = {
    fg = record_color_rgb,
    bg = record_color:shade(0.75):to_rgb(),
    bold = true,
}

local rec_animation = Animation(math.huge, 1.5, easing.line, function()
    emitter:emit(animation_event)
end)

emitter:merge_autocmds(macro_rec_redraw, {
    'RecordingEnter',
    'RecordingLeave',
    emitter:user_event(animation_event),
})

return {
    static = {
        blink = false,
        get_state = function(self)
            return self.state.macro_rec
        end,
    },
    init = function(self)
        if self:get_state().is_recording then
            rec_animation:run()
        else
            rec_animation:finish()
        end
    end,
    component({
        condition = function(self)
            return self:get_state().is_recording
        end,
        init = function(self)
            local register = self:get_state().register
            local indicator = self.blink and '󰧞' or ''

            self.blink = not self.blink

            return Badge({
                content = ' recording @' .. register .. indicator .. ' ',
                hl = record_hl,
                round = {
                    left = false,
                },
            }, self)
        end,
    }),
    update = emitter:user_event(
        macro_rec_redraw,
        vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end)
    ),
}
