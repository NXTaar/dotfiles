return with_actions({
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    opts = {
        columns = { 'icon' },
        view_options = {
            show_hidden = true,
        },
    },
    keys = {
        [ACTIONS.OPEN_FILE_TREE] = 'Oil',
    },
})
