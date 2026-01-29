local LazyStorage = require('nxtaar.utils.lazy_value').LazyStorage
local mode_constants = require('nxtaar.editor.statusline.constants.mode')
local theme = require('nxtaar.editor.statusline.theme')
local theme_utils = require('nxtaar.editor.statusline.utils.theme')

local mode_colors = LazyStorage:new(function(current_mode)
    local mode_palette = mode_constants.modes[current_mode].palette

    return theme_utils.build_color(theme[mode_palette], theme.text)
end)

return {
    init = function(self)
        local mode = mode_constants.nvim_mode_2_mode_name_map[vim.fn.mode(1)]
        local color = mode_colors:get(mode)
        local icon = mode_constants.modes[mode].icon

        self.state.mode = {
            name = mode,
            color = color,
            icon = icon,
        }
    end,
    update_event = {
        'ModeChanged',
        pattern = '*:*',
    },
}
