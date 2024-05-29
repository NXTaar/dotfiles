local lsp_zero = require('lsp-zero');

return {
    server = 'lua_ls',
    autoformat_files = { 'lua' },
    config = lsp_zero.nvim_lua_ls({
        settings = {
            Lua = {
                format = {
                    defaultConfig = {
                        quote_style = 'single'
                    }
                }
            }
        }
    })
}

