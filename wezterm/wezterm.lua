-- Pull in the wezterm API
local wezterm = require 'wezterm'
local theme = require 'theme'
local font = require 'font'
local window = require 'window'
local tabbar = require 'tabbar'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_cwd = wezterm.home_dir .. '/Projects/tochka/'

font.apply_config(config)
theme.apply_config(config)
window.apply_config(config)
tabbar.apply_config(config)

config.keys = {
    {
        key = 'f',
        mods = 'CMD|CTRL',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },
    { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}

-- and finally, return the configuration to wezterm
return config
