local consts = {
    palette = require('nxtaar.editor.statusline.constants.palette'),
    mode = require('nxtaar.editor.statusline.constants.mode'),
}
local mode = require('nxtaar.editor.statusline.components.mode')
local theme_utils = require('nxtaar.editor.statusline.utils.theme')
local theme = theme_utils.extract_theme(consts.palette.palette_extract_info)

-- vim.print(consts.palette)

-- vim.fn.setreg(
--     '+',
--     vim.json.encode({
--         colors = {
--             normal = theme_utils.build_color(theme.normal, theme.text),
--             insert = theme_utils.build_color(theme.insert, theme.text),
--             replace = theme_utils.build_color(theme.replace, theme.text),
--             visual = theme_utils.build_color(theme.visual, theme.text),
--             command = theme_utils.build_color(theme.command, theme.text),
--         },
--     })
-- )
local mode_colors = {}

return {
    static = {
        consts = consts,
        -- colors = {
        --     normal = theme_utils.build_color(theme.normal, theme.text),
        --     insert = theme_utils.build_color(theme.insert, theme.text),
        --     replace = theme_utils.build_color(theme.replace, theme.text),
        --     visual = theme_utils.build_color(theme.visual, theme.text),
        --     command = theme_utils.build_color(theme.command, theme.text),
        -- },

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
}
