return with_actions({
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
        [ACTIONS.MOVEMENT_JUMP] = function()
            require('flash').jump()
        end,
        [ACTIONS.MOVEMENT_TREESITTER] = function()
            require('flash').treesitter()
        end,
    },
})
