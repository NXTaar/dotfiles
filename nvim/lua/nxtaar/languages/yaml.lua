local json_schemas = require('schemastore').json.schemas()

return {
    formatting = {
        yaml = { 'prettier' },
    },
    yamlls = {
        cmd = { 'yaml-language-server', '--stdio' },
        filetypes = {
            'yaml',
            'yaml.docker-compose',
            'yaml.gitlab',
            'yaml.helm-values',
        },
        root_markers = { '.git' },
        schemastore = {
            enable = true,
        },
        settings = {
            redhat = { telemetry = { enabled = false } },
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
