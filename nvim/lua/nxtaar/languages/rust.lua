return {
    plugins = {
        {
            'Saecki/crates.nvim',
            event = { 'BufRead Cargo.toml' },
            opts = {
                completion = {
                    crates = {
                        enabled = true,
                    },
                },
                lsp = {
                    enabled = true,
                    actions = true,
                    completion = true,
                    hover = true,
                },
            },
        },
        {
            'mrcjkb/rustaceanvim',
            version = '^5',
            lazy = false,
            ft = 'rust',
        },
    },
}
