local wezterm = require 'wezterm'
local M = {}

function M.apply_config(config)
    config.native_macos_fullscreen_mode = true

    config.window_padding = {
        left = 0,
        top = 0,
        right = 0,
        bottom = 0,
    }
    if string.find(wezterm.target_triple, 'windows') then
        config.window_background_opacity = 0.9
    else
        config.window_background_opacity = 0.8
    end

    config.macos_window_background_blur = 40
    config.win32_system_backdrop = 'Acrylic'
    config.window_decorations = 'RESIZE'
    config.window_close_confirmation = 'NeverPrompt'
end

return M
