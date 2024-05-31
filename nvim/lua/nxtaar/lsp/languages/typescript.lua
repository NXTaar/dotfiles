local ts = require('typescript')
local tbl_find = require('nxtaar.utils.table').tbl_find

local formatters = { { 'biome', 'prettier' } }

return {
    formatting = {
        javascriptreact = formatters,
        javascript = formatters,
        typescriptreact = formatters,
        typescript = formatters,
    },
    tsserver = {
        server = {
            on_attach = function()
                register_keymap_action('typescript.add-missing-imports', function()
                    ts.actions.addMissingImports()
                end)
                register_keymap_action('typescript.remove-unused-imports', function()
                    ts.actions.removeUnused()
                end)
                register_keymap_action('typescript.organize-imports', function()
                    ts.actions.organizeImports()
                end)
            end,
        },
    },
    biome = {},
    eslint = {
        on_attach = function(client, bufnr)
            local path = vim.api.nvim_buf_get_name(bufnr)

            local use_custom_config = tbl_find({
                'tochka/reports',
                'tochka/t15%-api',
                'tochka/tar%-core',
                'tochka/documents%-signer',
                'tochka/qes%-settings',
                'tochka/tar%-demand',
                'tochka/tax%-patents',
                'tochka/tax%-auto%-reports',
            }, function(pattern)
                return string.find(path, pattern)
            end)

            if use_custom_config then
                client.config.settings.options = {
                    overrideConfigFile = './.eslintrc.prettier.json',
                }
            end

            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = bufnr,
                command = 'EslintFixAll',
            })
        end,
    },
}
