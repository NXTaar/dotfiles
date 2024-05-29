local action = require('nxtaar.utils.actions').action

return {
    ['lsp.show-hint'] = vim.lsp.buf.hover,
    ['lsp.go-to-definition'] = vim.lsp.buf.definition,
    ['lsp.go-to-declaration'] = vim.lsp.buf.declaration,
    ['lsp.go-to-implementation'] = vim.lsp.buf.implementation,
    ['lsp.go-to-type-definition'] = vim.lsp.buf.type_definition,
    ['lsp.go-to-references'] = action('trouble.show-references'),
    ['lsp.signature-help'] = vim.lsp.buf.signature_help,
    ['lsp.rename'] = vim.lsp.buf.rename,
    ['lsp.format-async'] = function()
        vim.lsp.buf.format({ async = true })
    end,
    ['lsp.code-action'] = vim.lsp.buf.code_action,
    ['lsp.show-info'] = vim.diagnostic.open_float,
    ['lsp.diagnostic-go-to-prev'] = vim.diagnostic.goto_prev,
    ['lsp.diagnostic-go-to-next'] = vim.diagnostic.goto_next
}

