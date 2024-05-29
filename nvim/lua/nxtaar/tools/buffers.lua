local actions = require('nxtaar.utils.action-names')

register_keymap_action(actions.BUFFERS_CLOSE_ALL_BUT_CURRENT, function()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()
    local closed_count = vim.tbl_count(bufs)

    for _, i in ipairs(bufs) do
        if i ~= current_buf then
            vim.api.nvim_buf_delete(i, {})
        end
    end

    vim.print('Closed buffers: ' .. closed_count - 1)
end)

