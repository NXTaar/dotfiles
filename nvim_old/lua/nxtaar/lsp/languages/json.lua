local json_schemas = require('schemastore').json.schemas()

return {
    formatting = {
        json = { 'prettier' }
    },
    jsonls = {
        settings = {
            json = {
                validate = {
                    enable = true,
                },
                schemas = json_schemas,
            },
        },
    },
}
