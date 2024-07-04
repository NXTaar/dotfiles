local function harpoon_config()
    local harpoon = require('harpoon')

    harpoon:setup()

    register_keymap_action('navigation.go-to-previous', function()
        harpoon:list():prev()
    end)
    register_keymap_action('navigation.go-to-next', function()
        harpoon:list():next()
    end)
    register_keymap_action('navigation.mark-file', function()
        harpoon:list():add()
    end)
    register_keymap_action('navigation.toggle-menu', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
end

local function hop_config()
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection

    hop.setup()

    register_keymap_action('navigation.line.next-symbol', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end)
    register_keymap_action('navigation.line.previous-symbol', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end)

    register_keymap_action('navigation.line.next-symbol-before-cursor', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end)
    register_keymap_action('navigation.line.previous-symbol-before-curson', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end)

    register_keymap_action('navigation.hop-2chars', 'HopChar2')
    register_keymap_action('navigation.hop-line', 'HopLine')
    register_keymap_action('navigation.hop-vertical', 'HopVertical')
    register_keymap_action('navigation.hop-word', 'HopWord')
    register_keymap_action('navigation.hop-pattern', 'HopPattern')
end

local M = {
    {
        'phaazon/hop.nvim',
        config = hop_config,
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        config = harpoon_config,
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}

return M
