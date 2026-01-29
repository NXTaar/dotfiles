local CONFGIG_PATH = vim.fn.stdpath('config')
local lang_root = CONFGIG_PATH .. '/lua/nxtaar/lsp/languages/'

local M = {}

M.server_configs = {}
M.formatting = {}
M.ensure_installed_servers = {}

for file in vim.fs.dir(lang_root) do
    -- rust has specific own configuration without lsp-server
    if string.find(file, 'rust') then
        goto continue
    end

    local lang = dofile(lang_root .. file)

    local has_ensure_installed = lang['ensure_installed'] ~= nil
    local has_formatting = lang['formatting'] ~= nil

    if has_ensure_installed then
        for _, v in ipairs(lang.ensure_installed) do
            table.insert(M.ensure_installed_servers, v)
        end

        lang.ensure_installed = nil
    end

    if has_formatting then
        M.formatting = vim.tbl_extend('force', M.formatting, lang.formatting)

        lang.formatting = nil
    end

    for server, config in pairs(lang) do
        if not has_ensure_installed then
            M.ensure_installed_servers[#M.ensure_installed_servers + 1] = server
        end

        M.server_configs[server] = config
    end
    ::continue::
end

return M
