local wezterm = require 'wezterm'
local colors = require 'theme'.colors

local M = {}

function M.apply_config(config)
    -- config.hide_tab_bar_if_only_one_tab = true
    config.show_tab_index_in_tab_bar = false
    config.use_fancy_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false
    config.colors = {
        tab_bar = {
            background = colors.idle.bg
        }
    }
end

local TAB_LEFT_EDGE = wezterm.nerdfonts.ple_left_half_circle_thick
local TAB_RIGHT_EDGE = wezterm.nerdfonts.ple_right_half_circle_thick
local ACTIVE_SIGN = wezterm.nerdfonts.fa_circle
local IDLE_SIGN = wezterm.nerdfonts.fa_circle_o
local CLOCK = wezterm.nerdfonts.md_clock_outline
local CALENDAR = wezterm.nerdfonts.md_calendar

local active = true
local idle = false
local tab_styles = {
    [active] = function(title)
        return {
            { Background = { Color = colors.active.text } },
            { Foreground = { Color = colors.active.bg } },
            { Text = TAB_LEFT_EDGE },
            { Background = { Color = colors.active.bg } },
            { Foreground = { Color = colors.active.text } },
            { Text = ACTIVE_SIGN .. ' ' .. title },
            { Background = { Color = colors.active.text } },
            { Foreground = { Color = colors.active.bg } },
            { Text = TAB_RIGHT_EDGE },
        }
    end,
    [idle] = function(title)
        return {
            { Background = { Color = colors.idle.bg } },
            { Foreground = { Color = colors.idle.text } },
            { Text = ' ' .. IDLE_SIGN .. ' ' .. title .. ' ' },
        }
    end
}

local function basename(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local title = basename(tab.active_pane.foreground_process_name)

        title = wezterm.truncate_right(title, max_width - 2)
        return tab_styles[tab.is_active](title)
    end
)

wezterm.on('update-right-status', function(window, pane)
    local date = wezterm.strftime(CLOCK .. '  %H:%M | ' .. CALENDAR .. '  %A, %B %-d ');

    window:set_right_status(wezterm.format({
        { Text = date }
    }))
end)

return M
