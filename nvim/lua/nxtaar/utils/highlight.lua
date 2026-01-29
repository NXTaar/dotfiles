local M = {}

local function hl(content, group)
    return string.format('%s%s', '%#' .. group .. '#', content)
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
            table.insert(result, hl(unpack(token)))
        end
    end

    return table.concat(result, separator)
end

return M
