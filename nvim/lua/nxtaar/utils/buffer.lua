local M = {}

function M.validate_bufnr(bufnr)
    vim.validate('bufnr', bufnr, 'number')
    return bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
end

return M
