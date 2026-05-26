return {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    opts = {
        columns = {'icon'},
        view_options = {
            show_hidden = true
        }
    },
keys = lazy_keys {
    [ACTIONS.OPEN_FILE_TREE] = "Oil"
}

}
