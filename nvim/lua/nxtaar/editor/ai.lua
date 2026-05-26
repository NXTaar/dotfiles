return {
    'frankroeder/parrot.nvim',
    dependencies = { 'ibhagwan/fzf-lua' },
    opts = {
        providers = {
            custom = {
                style = 'openai',
                api_key = os.getenv('OPENROUTER_API_KEY'),
                endpoint = 'https://openrouter.ai/api/v1/chat/completions',
                models = {
                    'anthropic/claude-sonnet-4',
                    'google/gemini-2.5-pro-preview',
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
