local json_schemas = require('schemastore').json.schemas()

return {
    formatting = {
        yaml = { 'prettier' }
    },
    yamlls = {
        schemastore = {
            enable = true,
        },
        settings = {
            yaml = {
                hover = true,
                completion = true,
                validate = {
                    enable = true,
                },
                schemas = json_schemas,
            },
        },
    },
}
