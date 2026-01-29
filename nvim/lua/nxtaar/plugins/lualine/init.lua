return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local repo = require('nxtaar.plugins.lualine.repo')
        local macro_rec = require('nxtaar.plugins.lualine.macro_rec')

        require('lualine').setup({
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { left = '', right = '' },
                        padding = 0,
                        color = { gui = 'bold' },
                    },
                },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { repo, 'filename' },
                lualine_y = { 'overseer' },
                lualine_x = { macro_rec, 'filetype' },
            },
        })
    end,
}
