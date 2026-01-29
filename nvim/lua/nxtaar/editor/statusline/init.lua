return {
    'rebelot/heirline.nvim',
    event = 'UiEnter',
    config = function()
        local heirline = require('heirline')
        local root = require('nxtaar.editor.statusline.components.root')

        heirline.setup({
            statusline = root,
        })
    end,
}
