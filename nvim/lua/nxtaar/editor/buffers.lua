return with_actions({
    'nvim-mini/mini.bufremove',
    version = false,
    config = function()
        local bd = require('mini.bufremove')

        bd.setup()

        vim.api.nvim_create_user_command('Bd', function(opts)
            local force = opts.bang
            local bufnr = tonumber(opts.args) or 0

            bd.delete(bufnr, force)
        end, {
            bang = true,
            nargs = '?',
            complete = 'buffer',
        })

        -- Make :bd call :Bd instead
        vim.cmd([[cabbrev bd Bd]])
    end,
})
