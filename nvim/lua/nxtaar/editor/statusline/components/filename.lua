local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local devicons = require('nvim-web-devicons')
local Pill = require('nxtaar.editor.statusline.components.ui.pill')

local extend_name_files = {
    'index.js',
    'index.ts',
    'init.lua',
    'mod.rs'
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

    static = {
        filename_hl = utils.get_highlight('DiagnosticVirtualTextInfo'),
    },

    init = function(self)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t')
        local extension = vim.fn.fnamemodify(filename, ':e')

        self.filename_icon, self.filename_color = devicons.get_icon_color(filename, extension, { default = true })
        self.filename = filename
    end,

    Pill({
        single_pill = true,
        icon = function(self)
            return self.icon or ''
        end,
        icon_color = function(self)
            return self.color or self.filename_hl.fg
        end,
        pill_color = function(self)
            return self.filename_hl.bg
        end,
        content = function(self)
            return self.filename
        end,
        content_hl = function(self)
            return {
                fg = self.filename_hl.fg,
                bg = self.filename_hl.bg,
                bold = false,
            }
        end,
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
