local json_schemas = require('schemastore').json.schemas()

return {
    server = 'yamlls',
    autoformat_files = { 'yaml' },
    config = {
        schemastore = {
            enable = true
        },
        settings = {
            yaml = {
                hover = true,
                completion = true,
                validate = {
                    enable = true
                },
                schemas = json_schemas
            }
        }
    }
}
