local M = {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
}

local CONFGIG_PATH = vim.fn.stdpath('config')
local rules_root = CONFGIG_PATH .. '/lua/nxtaar/editor/notifications/rules/'

function M.config()
    local noice = require('noice')

    local opts = {
        presets = {
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        routes = {}
    }

    for file in vim.fs.dir(rules_root) do
        local rule = dofile(rules_root .. file)

        table.insert(opts.routes, rule)
    end

    noice.setup(opts)
end

return M
