local default_props = {
    hl = { bg = '#ffffff', fg = '#000000' },
    overlay = {},
    round = {
        left = true,
        right = true,
    },
}

return function(externals, ctx)
    local props = vim.tbl_deep_extend('force', default_props, externals)
    local overlay_default = ctx.default_hl.bg
    local result = {}

    if props.round.left then
        table.insert(result, {
            provider = '',
            hl = {
                fg = props.hl.bg,
                bg = props.overlay.left or overlay_default,
            },
        })
    end

    if props.content then
        table.insert(result, {
            provider = props.content,
            hl = props.hl,
        })
    end

    if props.round.right then
        table.insert(result, {
            provider = '',
            hl = {
                fg = props.hl.bg,
                bg = props.overlay.right or overlay_default,
            },
        })
    end

    return result
end
