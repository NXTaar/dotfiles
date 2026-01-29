local ensure_installed = require('nxtaar.system.languages').ensure_installed

return {
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = ensure_installed,
        },
    },
}
