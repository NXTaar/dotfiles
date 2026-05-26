local consts = {
    palette = require('nxtaar.editor.statusline.constants.palette'),
    mode = require('nxtaar.editor.statusline.constants.mode'),
}
local mode = require('nxtaar.editor.statusline.components.mode')
local git_branch = require('nxtaar.editor.statusline.components.git_branch')
local theme_utils = require('nxtaar.editor.statusline.utils.theme')
local theme = theme_utils.extract_theme(consts.palette.palette_extract_info)

local mode_colors = {}

return {
    static = {
        consts = consts,
        mode_color = function(self, current_mode)
            local color = mode_colors[current_mode]

            if color == nil then
                local mode_palette =
                    self.consts.mode.modes[current_mode].palette
                color = theme_utils.build_color(theme[mode_palette], theme.text)
                mode_colors[current_mode] = color
            end

            return color
        end,
    },
    mode,
    git_branch,
}
