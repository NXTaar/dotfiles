--- Cache tables to store repository information
local repo_names_cache = {}
local repo_roots_cache = {}

local M = {}

---@brief Get the root directory of a git repository for a given file path
---@param file_path string The file path to check
---@return string|nil The git repository root directory or nil if not found
function M.get_repo_root(file_path)
    if type(file_path) ~= 'string' or #file_path == 0 then
        return nil
    end

    local cached_value = repo_roots_cache[file_path]

    if cached_value ~= nil then
        return type(cached_value) == 'string' and cached_value or nil
    end

    local root = vim.fs.root(file_path, '.git')

    if not root or root == '.' then
        repo_roots_cache[file_path] = false
        return nil
    end

    -- Cache the successful result
    repo_roots_cache[file_path] = root
    return root
end

---@brief Get the name of a git repository for a given file path
---@param file_path string The file path to check
---@return string|nil The git repository name or nil if not found
function M.get_repo_name(file_path)
    if type(file_path) ~= 'string' or #file_path == 0 then
        return nil
    end

    local cached_value = repo_names_cache[file_path]

    if cached_value ~= nil then
        return type(cached_value) == 'string' and cached_value or nil
    end

    local root = M.get_repo_root(file_path)

    if not root then
        repo_names_cache[file_path] = false
        return nil
    end

    local repo = vim.fn.fnamemodify(root, ':t')

    repo_names_cache[file_path] = repo

    return repo
end

---@brief Get both the root directory and name of a git repository for a given file path
---@param file_path string The file path to check
---@return table|nil Table with {root = string, repo = string} or nil if not found
function M.get_repo(file_path)
    if type(file_path) ~= 'string' or #file_path == 0 then
        return nil
    end

    local root = M.get_repo_root(file_path)

    if not root then
        return nil
    end

    local repo = M.get_repo_name(file_path)

    return {
        root = root,
        repo = repo
    }
end

return M
