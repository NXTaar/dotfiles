return {
    'frankroeder/parrot.nvim',

    opts = {
        providers = {
            openrouter = {
                name = 'openrouter',
                api_key = os.getenv('OPENROUTER_API_KEY'),
                endpoint = 'https://openrouter.ai/api/v1/chat/completions',
                models = {
                    'anthropic/claude-sonnet-4',
                    'google/gemini-2.5-pro-preview',
                    'openai/gpt-5',
                },
                -- parameters to summarize chat
                topic = {
                    model = 'gpt-4o-mini',
                    params = { max_completion_tokens = 64 },
                },
                -- default parameters
                params = {
                    chat = { temperature = 1.1, top_p = 1 },
                    command = { temperature = 1.1, top_p = 1 },
                },
            },
        },
    },
}
