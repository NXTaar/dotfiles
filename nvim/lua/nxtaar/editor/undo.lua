local M = {
    'mbbill/undotree',
}

function M.config()
    register_keymap_action('undo.toggle-tree', 'UndotreeToggle', 'cmd')
end

return M
