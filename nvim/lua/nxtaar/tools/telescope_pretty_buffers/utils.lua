local map = vim.tbl_map
local M = {}

--- Ask user to confirm an action
---@param prompt string: The prompt for confirmation
---@param default_value string: The default value of user input
---@param yes_values table: List of positive user confirmations ({"y", "yes"} by default)
---@return boolean: Whether user confirmed the prompt
function M.ask_to_confirm(prompt, default_value, yes_values)
    yes_values = yes_values or { 'y', 'yes' }
    default_value = default_value or ''
    local confirmation = vim.fn.input(prompt, default_value)
    confirmation = string.lower(confirmation)
    if string.len(confirmation) == 0 then
        return false
    end
    for _, v in pairs(yes_values) do
        if v == confirmation then
            return true
        end
    end
    return false
end

function M.get_buffer_file_path(bufnr)
    return vim.api.nvim_buf_get_name(bufnr)
end

function M.get_buffer_file_name(bufnr)
    local fullname = M.get_buffer_file_path(bufnr)
    return vim.fn.fnamemodify(fullname, ':p:t')
end

function M.get_longest_buffer_filename_length(buffers)
    local filename_widths = map(function(bufnr)
        return vim.fn.strdisplaywidth(M.get_buffer_file_name(bufnr))
    end, buffers)

    return math.max(unpack(filename_widths))
end

function M.get_buffer_repo_name(bufnr)
    local full_path = M.get_buffer_file_path(bufnr)
    local git_path = vim.fn.finddir('.git', full_path .. ';')
    if git_path == '' then
        return git_path
    end
    return vim.fn.fnamemodify(git_path, ':p:h:h:t')
end

function M.get_longest_buffer_reponame_length(buffers)
    local repo_widths = map(function(bufnr)
        return vim.fn.strdisplaywidth(M.get_buffer_repo_name(bufnr))
    end, buffers)

    return math.max(unpack(repo_widths))
end

return M
