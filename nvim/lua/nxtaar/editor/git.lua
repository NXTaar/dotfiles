return with_actions({
    'lewis6991/gitsigns.nvim',
    opts = {
        signs_staged_enable = false,
        signcolumn = false,
    },
    keys = {
        [ACTIONS.GIT_BLAME_LINE_SHOW] = function()
            require('gitsigns').blame_line({ full = true })
        end,
    },
})
