local wezterm = require 'wezterm'

local FONT_SOURCE_CODE = wezterm.font('SauceCodePro Nerd Font Mono', { weight = 'Bold', })

local M = {
    font_family = FONT_SOURCE_CODE
}

function M.apply_config(config)
    config.font = FONT_SOURCE_CODE
    config.font_size = 14
    config.line_height = 1.1
end

return M
