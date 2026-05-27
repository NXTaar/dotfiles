return {
    'saghen/blink.cmp',
    branch = 'main',
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
    },
    build = function()
        require('blink.cmp').build():wait(60000)
    end,
    opts = {
        sources = {
            default = {
                'codecompanion',
                'lazydev',
                'lsp',
                'path',
                'snippets',
                'buffer',
            },
            providers = {
                codecompanion = {
                    name = 'CodeCompanion',
                    module = 'codecompanion.providers.completion.blink',
                    enabled = true,
                    score_offset = 10,
                },
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                },
            },
        },
    },
}
