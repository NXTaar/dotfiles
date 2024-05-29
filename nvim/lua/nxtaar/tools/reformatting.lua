local function treesj_conf()
    local tsj = require('treesj')

    tsj.setup({ use_default_keymaps = false })

    register_keymap_action('reformat.toggle', tsj.toggle)
    register_keymap_action('reformat.split', tsj.split)
    register_keymap_action('reformat.join', tsj.join)
end

local M = {
    { 'Wansmer/treesj', config = treesj_conf },
    'tpope/vim-unimpaired',
    'tpope/vim-surround',
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
    }
}

return M
