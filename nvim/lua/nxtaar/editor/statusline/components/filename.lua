local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local devicons = require('nvim-web-devicons')
local Pill = require('nxtaar.editor.statusline.components.ui.pill')
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

return {
    condition = function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
        return vim.bo.buftype == '' and filename ~= ''
    end,

    init = function(self)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
        local extension = vim.fn.fnamemodify(filename, ':e')

        self.filename_icon, self.filename_color =
            devicons.get_icon_color(filename, extension, { default = true })
        self.filename = filename
    end,

    Pill({
        single_pill = true,
        icon = function(self)
            return self.filename_icon or ''
        end,
        icon_color = function(self)
            return self.filename_color or self.filename_hl.fg
        end,
        pill_color = content_bg,
        content = function(self)
            return self.filename
        end,
        content_hl = {
            fg = content_fg,
            bg = content_bg,
            bold = false,
        },
    }),

    update = {
        'BufEnter',
        'BufWritePost',
        'BufFilePost',
        'BufNewFile',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
    },
}
