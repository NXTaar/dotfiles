local formatters_by_ft = require('nxtaar.system.languages').formatting
return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = formatters_by_ft,
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback"
        }
    }
}
