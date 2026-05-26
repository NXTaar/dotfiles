return with_actions({
    'folke/trouble.nvim',
    opts = {
        focus = true,
    },
    cmd = 'Trouble',
    keys = {
        [ACTIONS.LSP_REFERENCES_SHOW] = function()
            require('trouble').open('lsp_references')
        end,
        [ACTIONS.DIAGNOSTICS_SHOW] = function()
            require('trouble').open('diagnostics')
        end,
    },
})
