local M = {}


function M.apply_config(config)
    config.native_macos_fullscreen_mode = true

    config.window_padding = {
        left = '1cell',
        top = 0,
        bottom = '1px',
    }

    config.window_background_opacity = 0.8
    config.macos_window_background_blur = 40
    config.window_decorations = 'RESIZE'
    config.window_close_confirmation = 'NeverPrompt'
end

return M
