local heirline_utils = require('heirline.utils')
local M = {}

function M.resolve_content(factory, ctx)
    return type(factory) == 'function' and factory(ctx) or factory
end

function M.resolve_hl(hl, ctx)
    local hl_type = type(hl)

    if hl_type == 'string' then
        local hl_group = heirline_utils.get_highlight(hl)

        if not hl_group then
            vim.notify(
                'statusline: no hightligt group resolved for input: ' .. hl
            )
        end

        return hl_group
    end

    if hl_type == 'table' then
        return hl
    end

    if hl_type == 'function' then
        return M.resolve_hl(hl(ctx))
    end

    return nil
end

return M
