local M = {
    'stevearc/oil.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        columns = { 'icon' },
        view_options = {
            show_hidden = true
        }
    }
}

register_keymap_action('oil.open', 'Oil', 'cmd')

return M
