local get_color_with_fallback =
    require('nxtaar.utils.highlight').get_color_with_fallback
local Color = require('nxtaar.utils.color')
local M = {}

local black = '#000000'

function M.extract_theme(palette)
    local result = {}

    for color, hl_setup in pairs(palette) do
        local hl_groups, attr = unpack(hl_setup)
        local extracted_color = get_color_with_fallback(hl_groups, attr, black)

        result[color] = extracted_color
    end

    return result
end

---Builds a color configuration table for active and idle states
---@param target_color string Hex color string (e.g., "#ff0000") or vim highlight group name
---@param text_color string Hex color string (e.g., "#ffffff") or vim highlight group name
---@return { active: { fg: string, bg: string }, idle: { fg: string, bg: string } } color_config Color configuration with active and idle state properties
function M.build_color(target_color, text_color)
    return {
        active = {
            fg = text_color,
            bg = target_color,
        },
        idle = {
            fg = target_color,
            bg = Color:new(target_color):desaturate_by(0.6):shade(0.7):to_rgb(),
        },
    }
end

return M
