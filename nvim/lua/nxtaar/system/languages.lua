local CONFGIG_PATH = vim.fn.stdpath('config')
local lang_root = CONFGIG_PATH .. '/lua/nxtaar/languages/'

local M = {}

M.plugins = {}
M.formatting = {}
M.servers = {}
M.keymaps = {}
M.ensure_installed = {}
M.skip_install = {}

for file in vim.fs.dir(lang_root) do
    local module = vim.fn.fnamemodify(file, ':r')
    local lang = require('nxtaar.languages.' .. module)
    local skip_install = lang.skip_install or {}

    M.skip_install = vim.list_extend(M.skip_install, skip_install)

    for field, item in pairs(lang) do
        local field_type = type(field)

        if field == 'plugins' then
            M.plugins[#M.plugins + 1] = item
        elseif field == 'formatting' then
            M.formatting = vim.tbl_extend('force', M.formatting, item)
        elseif field == 'skip_install' then
        elseif field_type == 'number' then
            M.servers[item] = {}
            if not vim.list_contains(skip_install, item) then
                M.ensure_installed[#M.ensure_installed + 1] = item
            end
        elseif field_type == 'string' then
            if type(item) == 'table' and item.keymaps then
                M.keymaps[field] = item.keymaps
                item = vim.tbl_extend('force', item, { keymaps = nil })
            end
            M.servers[field] = item
            if not vim.list_contains(skip_install, field) then
                M.ensure_installed[#M.ensure_installed + 1] = field
            end
        end
    end
end

return M
