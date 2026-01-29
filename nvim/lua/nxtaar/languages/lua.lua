return {
    plugins = {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = { -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                {
                    path = '${3rd}/luv/library',
                    words = { 'vim%.uv' },
                },
            },
        },
    },
    formatting = {
        lua = { 'stylua' },
    },
    lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = {
            '.luarc.json',
            '.luarc.jsonc',
            '.luacheckrc',
            '.stylua.toml',
            'stylua.toml',
            'selene.toml',
            'selene.yml',
            '.git',
        },
        settings = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                },
                diagnostics = {
                    globals = { 'Snacks' },
                },
                codeLens = {
                    enable = true,
                },
                completion = {
                    callSnippet = 'Replace',
                },
                doc = {
                    privateName = { '^_' },
                },
                hint = {
                    enable = true,
                    setType = false,
                    paramType = true,
                    paramName = 'Disable',
                    semicolon = 'Disable',
                    arrayIndex = 'Disable',
                },
            },
        },
    },
}
