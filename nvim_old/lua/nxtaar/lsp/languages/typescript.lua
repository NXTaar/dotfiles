-- local ts = require('typescript')

local formatters = { 'eslint' }

local eslint_registry = {
    ['./.eslintrc.prettier.json'] = {
        'tochka/reports',
        'tochka/tar%-core',
        'tochka/documents%-signer',
        'tochka/qes%-settings',
        'tochka/tar%-demand',
        'tochka/tax%-patents',
    },
    ['./.eslintrc.custom.json'] = {
        'tochka/tar%-kit',
    }
}

local function resolve_custom_config(path)
    for override, patterns in pairs(eslint_registry) do
        for _, pattern in ipairs(patterns) do
            if string.find(path, pattern) then
                return override
            end
        end
    end
end

return {
    formatting = {
        javascriptreact = formatters,
        javascript = formatters,
        typescriptreact = formatters,
        typescript = formatters,
    },
    -- tsserver = {
    --     server = {
    --         on_attach = function()
    --             register_keymap_action('typescript.add-missing-imports', function()
    --                 ts.actions.addMissingImports()
    --             end)
    --             register_keymap_action('typescript.remove-unused-imports', function()
    --                 ts.actions.removeUnused()
    --             end)
    --             register_keymap_action('typescript.organize-imports', function()
    --                 ts.actions.organizeImports()
    --             end)
    --         end,
    --     },
    -- },
    vtsls = {},
    biome = {},
    eslint = {
        -- on_attach = function(client, bufnr)
        --     local path = vim.api.nvim_buf_get_name(bufnr)
        --
        --     local custom_config_override = resolve_custom_config(path)
        --
        --     if custom_config_override then
        --         client.config.settings.options = {
        --             overrideConfigFile = custom_config_override
        --         }
        --     end
        -- end,
    },
}
