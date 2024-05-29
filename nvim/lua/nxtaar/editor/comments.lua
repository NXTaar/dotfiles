vim.g.skip_ts_context_commentstring_module = true

local M = {
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    {
        'terrortylor/nvim-comment',
        main = 'nvim_comment',
        opts = {
            comment_empty = false
        }
    }
}

return M
