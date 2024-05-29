local tbl_find = require('nxtaar.utils.table').tbl_find

return {
    {
        server = 'tsserver',
        config = {
            server = {
                on_attach = function()
                    register_keymap_action('typescript.add-missing-imports', '<cmd>TypescriptAddMissingImports<cr>')
                    register_keymap_action('typescript.remove-unused-imports', '<cmd>TypescriptRemoveUnused<cr>')
                end
            }
        }
    },
    {
        server = 'biome',
        autoformat_files = {
            'typescript'
        },
        config = {
            autostart = false
        }
    },
    {
        server = 'eslint',
        autoformat_files = {
            'typescript'
        },
        config = {
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
                    'tochka/tax%-auto%-reports'
                }, function(pattern) return string.find(path, pattern) end)

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
        }
    }
}
