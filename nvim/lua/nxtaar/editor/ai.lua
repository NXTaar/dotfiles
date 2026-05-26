return with_actions({
    'olimorris/codecompanion.nvim',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },

    keys = {
        [ACTIONS.AI_CHAT_TOGGLE] = 'CodeCompanionChat Toggle',
        [ACTIONS.AI_CHAT_ACTIONS] = 'CodeCompanionActions',
        [ACTIONS.AI_INLINE] = 'CodeCompanionChat',
        [ACTIONS.AI_CMD] = 'CodeCompanionCmd',
    },

    opts = {
        adapters = {
            http = {
                openrouter = function()
                    return require('codecompanion.adapters').extend('openai_compatible', {
                        env = {
                            url = 'https://openrouter.ai/api',
                            api_key = 'OPENROUTER_API_KEY',
                            chat_url = '/v1/chat/completions',
                        },
                        schema = {
                            model = {
                                default = 'anthropic/claude-sonnet-4',
                                choices = {
                                    ['anthropic/claude-sonnet-4'] = {},
                                    ['google/gemini-2.5-pro-preview'] = {},
                                    ['openai/gpt-5'] = {},
                                },
                            },
                            temperature = { default = 1.1 },
                            top_p = { default = 1 },
                        },
                    })
                end,
            },
            acp = {
                claude_code = function()
                    return require('codecompanion.adapters').extend('claude_code', {})
                end,
            },
        },

        interactions = {
            chat = {
                adapter = 'openrouter',
                opts = {
                    completion_provider = 'blink',
                },
            },
            inline = {
                adapter = 'openrouter',
            },
            cmd = {
                adapter = 'openrouter',
            },
        },

        display = {
            chat = {
                window = {
                    layout = 'vertical',
                    width = 0.4,
                    position = 'right',
                },
                show_token_count = true,
            },
        },
    },
})
