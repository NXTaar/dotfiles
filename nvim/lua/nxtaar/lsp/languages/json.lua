local json_schemas = require('schemastore').json.schemas()

return {
    server = 'jsonls',
    autoformat_files = { 'json' },
    config = {
        settings = {
            json = {
                validate = {
                    enable = true
                },
                schemas = json_schemas
            }
        }
    }
}
