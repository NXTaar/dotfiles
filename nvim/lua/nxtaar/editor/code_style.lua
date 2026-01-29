return with_actions({
    'Wansmer/treesj',
    opts = {
        use_default_keymaps = false,
    },
    keys = {
        [ACTIONS.REFORMAT_STRUCTURE_JOIN] = function()
            require('treesj').join()
        end,
        [ACTIONS.REFORMAT_STRUCTURE_SPLIT] = function()
            require('treesj').split()
        end,
        [ACTIONS.REFORMAT_STRUCTURE_TOGGLE] = function()
            require('treesj').toggle()
        end,
    },
})
