local wezterm = require 'wezterm'

local FONT_SOURCE_CODE = wezterm.font('SauceCodePro Nerd Font Mono', { weight = 'Bold', })

local M = {
    font_family = FONT_SOURCE_CODE
}

function M.apply_config(config)
    config.font = FONT_SOURCE_CODE

    if string.find(wezterm.target_triple, 'windows') then
        config.font_size = 12
    else
        config.font_size = 16
    end

    config.line_height = 1.1
end

return M
