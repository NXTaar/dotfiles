return {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true)
        end,
        default_settings = {
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true
                }
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}
