local M = {}

local function format_hl(content, group)
    return string.format('%s%s', '%#' .. group .. '#', content)
end

--- @param hl string
--- @return {fg:integer?,bg:integer?,[string]:any,ctermfg:integer?,ctermbg:integer?,cterm:{fg:integer?,bg:integer?,[string]:any}?}
M.get_hl = function(hl)
    return vim.api.nvim_get_hl(0, { name = hl, link = false })
end

function M.colored(setup, separator)
    separator = separator or ' '

    local result = {}

    for _, token in ipairs(setup) do
        local token_type = type(token)

        if token_type == 'string' then
            table.insert(result, token)
        end

        if token_type == 'table' then
            table.insert(result, format_hl(unpack(token)))
        end
    end

    return table.concat(result, separator)
end

--- @param highlights string|string[]
--- @param attr "fg"|"bg"|string
--- @param fallback_color string?
--- @return string?, integer, string?
M.get_color_with_fallback = function(highlights, attr, fallback_color)
    assert(type(highlights) == 'string' or type(highlights) == 'table')
    assert(type(attr) == 'string')
    local hls = type(highlights) == 'string' and { highlights } or highlights --[[@as table]]

    for i, hl in ipairs(hls) do
        local hl_value = M.get_hl(hl)
        if type(hl_value) == 'table' and type(hl_value[attr]) == 'number' then
            return string.format('#%06x', hl_value[attr]), i, hl
        end
    end

    return fallback_color, -1, nil
end
return M
