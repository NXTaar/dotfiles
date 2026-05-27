local ensure_installed = require('nxtaar.system.languages').ensure_installed

return {
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            {
                'mason-org/mason.nvim',
                opts = {},
            },
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = ensure_installed,
            automatic_enable = false,
        },
    },
}
