local formatters_by_ft = require('nxtaar.system.languages').formatting
return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = formatters_by_ft,
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
            filter = function(client)
                if client.name ~= 'vtsls' then return true end

                local format = true

                for _, item in ipairs(vim.lsp.get_clients()) do
                    if item.name == 'eslint' then format = false end
                end

                return format
            end,
        },
    },
}
