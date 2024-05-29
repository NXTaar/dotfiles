return {
    content = function(entry)
        return entry.bufnr
    end,
    width = function(meta)
        return #tostring(meta.biggest_buffer_digit)
    end,
    hl = 'TelescopeResultsNumber',
}
