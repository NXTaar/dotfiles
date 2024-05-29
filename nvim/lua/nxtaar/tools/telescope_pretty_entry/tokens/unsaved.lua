local strwidth = vim.fn.strwidth
local unsaved_icon = '󰠘'

return {
    width = function(meta)
        if meta.has_unsaved_buffers then
            return strwidth(unsaved_icon)
        end
        return nil
    end,
    content = function(entry, meta)
        return meta.changes_registry[entry.bufnr] and unsaved_icon or ''
    end,
    hl = 'Error'
}
