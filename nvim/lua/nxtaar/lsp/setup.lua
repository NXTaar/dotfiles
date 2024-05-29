local M = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
        { 'jose-elias-alvarez/typescript.nvim' },
        { 'stevearc/dressing.nvim' },
        { 'folke/neodev.nvim' },
        { 'b0o/schemastore.nvim' },
    }
}

function M.config()
    local lsp_zero = require('lsp-zero')
    local mason = require('mason')
    local dressing = require('dressing')
    local typescript = require('typescript')
    local mason_lspconfig = require('mason-lspconfig')
    local keymap_actions = require('nxtaar.lsp.keymap_actions')
    local diagnostic = require('nxtaar.lsp.diagnostic')
    local format_opts = require('nxtaar.lsp.formatting')
    local languages = require('nxtaar.lsp.lang_list')
    local neodev = require('neodev')

    -- Neovim specific LSP server (hints and docs)
    neodev.setup({})
    ----
    dressing.setup({
        input = {
            insert_only = false,
        }
    })

    -- Diagnostic
    vim.diagnostic.config({
        virtual_text = diagnostic.virtual_text,
    })
    lsp_zero.set_sign_icons(diagnostic.icons)
    ----

    -- Format on save
    lsp_zero.format_on_save(format_opts)
    ----

    -- Register language support
    for _, lang in ipairs(languages) do
        if lang.server ~= 'tsserver' then
            lsp_zero.configure(lang.server, lang.config)
        else
            typescript.setup(lang.config)
        end
    end
    ----

    -- Language servers installation
    mason.setup({})
    mason_lspconfig.setup({
        ensure_installed = vim.tbl_map(function(v) return v.server end, languages),
        handlers = {
            lsp_zero.default_setup
        }
    })
    ----

    -- Assign specific LSP keymaps
    lsp_zero.on_attach(function()
        for action, fn in pairs(keymap_actions) do
            register_keymap_action(action, fn)
        end
    end)
    ----
end

return M
