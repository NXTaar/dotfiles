return {
    filter = {
        find = 'Config Change Detected. Reloading',
        cond = function(message)
            return vim.tbl_get(message.opts, 'title') == 'lazy.nvim'
        end
    },
    view = 'mini',
    opts = {
        format = { '󰒓', { ' Lazy config changed', hl_group = 'DiagnosticWarn' } }
    }
}
