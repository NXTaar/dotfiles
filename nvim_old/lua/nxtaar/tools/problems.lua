local M = {
    'folke/trouble.nvim'
}

function M.config()
    local trouble = require('trouble')
    local register_action = require('nxtaar.utils.actions').register_action

    trouble.setup()

    register_keymap_action('problems.show-in-file', function()
        trouble.toggle('document_diagnostics')
    end)

    register_keymap_action('problems.show-in-workspace', function()
        trouble.toggle('workspace_diagnostics')
    end)

    register_keymap_action('problems.toggle', function()
        trouble.toggle()
    end)

    register_action('trouble.show-references', function()
        trouble.toggle('lsp_references')
    end)
end

return M
