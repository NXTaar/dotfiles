return {
    formatting = {
        json = { 'prettier' },
    },
    jsonls = {
        cmd = { 'vscode-json-language-server', '--stdio' },
        filetypes = { 'json', 'jsonc' },
        init_options = {
            provideFormatter = true,
        },
        root_markers = { '.git' },
        single_file_support = true,
        settings = {
            json = {
                validate = {
                    enable = true,
                },
                schemas = require('schemastore').json.schemas(),
            },
        },
    },
}
