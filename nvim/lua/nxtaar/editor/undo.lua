return with_actions({
    'mbbill/undotree',
    opts = {},
    keys = {
        [ACTIONS.UNDO_SHOW_TREE] = vim.cmd.UndotreeToggle,
    },
})
