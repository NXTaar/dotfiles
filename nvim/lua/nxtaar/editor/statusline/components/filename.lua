local devicons = require('nvim-web-devicons')
local Badge = require('nxtaar.editor.statusline.components.ui.badge')
local component = require('nxtaar.editor.statusline.utils.component').component
local Color = require('nxtaar.utils.color')

local base_color = Color.from_hl_group('ModeMsg', 'fg')
local base_color_rgb = base_color:to_rgb()

local content_fg = base_color_rgb
local content_bg = base_color:shade(0.75):to_rgb()

local extend_name_files = {
    'index.js',
    'index.ts',
    'init.lua',
    'mod.rs',
}

local extend_name_dict = {}

for _, file in ipairs(extend_name_files) do
    extend_name_dict[file] = true
end

return component({
    condition = function()
        return vim.bo.buftype == '' and vim.api.nvim_buf_get_name(0) ~= ''
    end,

    init = function(self)
        local full_path = vim.api.nvim_buf_get_name(0)
        local filename = vim.fn.fnamemodify(full_path, ':t')
        local extension = vim.fn.fnamemodify(filename, ':e')
        local display_name = nil

        local icon, icon_color =
            devicons.get_icon_color(filename, extension, { default = true })

        if extend_name_dict[filename] ~= nil then
            display_name = vim.fn.fnamemodify(full_path, ':h:t')
                .. '/'
                .. filename
        else
            display_name = filename
        end

        return {
            Badge({
                content = icon,
                hl = {
                    bg = content_bg,
                    fg = icon_color,
                },
                round = {
                    right = false,
                },
            }, self),
            Badge({
                content = ' ' .. display_name,
                hl = {
                    bg = content_bg,
                    fg = content_fg,
                },
                round = {
                    left = false,
                },
            }, self),
        }
    end,

    update = {
        'BufEnter',
        'BufWritePost',
        'BufFilePost',
        'BufNewFile',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
})
