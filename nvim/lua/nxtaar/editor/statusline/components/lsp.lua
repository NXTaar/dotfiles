local Badge = require('nxtaar.editor.statusline.components.ui.badge')
local devicons = require('nvim-web-devicons')
local component = require('nxtaar.editor.statusline.utils.component').component
local conditions = require('heirline.conditions')
local Color = require('nxtaar.utils.color')

local base_color = Color:new('#ffffff')
local base_color_rgb = base_color:to_rgb()

local icon_bg = base_color_rgb
local icon_color = '#000000'
local content_fg = base_color_rgb
local content_bg = base_color:shade(0.85):to_rgb()

local pretty_names = {
    lua_ls = {
        extension = 'lua',
        name = 'lua',
    },
    vtsls = {
        extension = 'ts',
        name = 'typescript',
    },
    yamlls = {
        extension = 'yaml',
        name = 'YAML',
    },
    cssls = {
        extension = 'css',
        name = 'CSS',
    },
    eslint = {
        extension = 'eslint.config.js',
        name = 'eslint',
    },
    jsonls = {
        extension = 'json',
        name = 'JSON',
    },
}

function LspServer(name, is_first, is_last)
    local result = {}

    if is_first then
        table.insert(result, {
            provider = '',
            hl = {
                fg = base_color_rgb,
                bg = content_bg,
            },
        })
    end

    if pretty_names[name] then
        local pretty = pretty_names[name]
        local icon, pretty_color =
            devicons.get_icon_color('', pretty.extension, { default = true })
        table.insert(result, {
            hl = {
                fg = pretty_color,
            },
            provider = icon,
        })
        table.insert(result, {
            provider = ' ' .. pretty.name .. ' ',
        })
    end
    if not pretty_names[name] then
        table.insert(result, {
            provider = (is_first and '' or ' ') .. name .. ' ',
        })
    end

    if not is_last then
        table.insert(result, {
            provider = '',
            hl = function()
                return {
                    fg = base_color_rgb,
                    bold = true,
                }
            end,
        })
    end

    return result
end

return component({
    condition = conditions.lsp_attached,
    update = {
        'LspAttach',
        'LspDetach',
    },
    init = function(self)
        local servers = vim.lsp.get_clients({ bufnr = 0 })
        local list = {}

        for i, server in pairs(servers) do
            local is_first = i == 1
            local is_last = i == vim.tbl_count(servers)
            table.insert(list, LspServer(server.name, is_first, is_last))
        end

        return {
            {
                hl = {
                    bg = content_bg,
                    fg = content_fg,
                },
                unpack(list),
            },
            Badge({
                content = ' LSP',
                hl = {
                    bg = icon_bg,
                    fg = icon_color,
                    bold = true,
                },
                overlay = {
                    left = content_bg,
                },
            }, self),
        }
    end,
})
