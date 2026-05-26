return {
    {
        l_key = '-',
        action = ACTIONS.OPEN_FILE_TREE,
    },
    {
        l_key = 'f',
        mode = 'n',
        action = ACTIONS.OPEN_FILE_SEARCH,
    },
    {
        l_key = '.',
        action = ACTIONS.OPEN_PACKAGE_MANAGER,
    },
    {
        l_key = 'w',
        action = ACTIONS.MOVEMENT_JUMP
    },
    {
        l_key = 's',
        action = ACTIONS.MOVEMENT_TREESITTER
    },
    { key = 'K', action = ACTIONS.LSP_HOVER },
    { key = 'gd', action = ACTIONS.LSP_GO_TO_DEFINITION },
    { key = 'gr', action = ACTIONS.LSP_SHOW_REFERENCES },
    { key = 'gx', action = ACTIONS.LSP_CODE_ACTION },
    { key = '<C-n>', action=ACTIONS.SEARCH_HIGHLIGHT_OFF, cmd = 'noh' },
}
