local servers = require('nxtaar.system.languages').servers

for server, config in pairs(servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {
            buffer = event.buf,
        }

        keymap_by_action({
            [ACTIONS.LSP_AVAILABLE_ACTIONS_SHOW] = vim.lsp.buf.code_action,
            [ACTIONS.LSP_GOTO_DEFINITION] = vim.lsp.buf.definition,
            [ACTIONS.LSP_SHOW_INFO] = vim.diagnostic.open_float,
            [ACTIONS.LSP_RESTART_SERVERS] = function()
                vim.lsp.stop_client(vim.lsp.get_clients())
                vim.cmd('e')
            end,
            [ACTIONS.LSP_POPULATE_DIAGNOSTICS_QL] = vim.diagnostic.setloclist,
        }, opts)
    end,
})
