local CONFGIG_PATH = vim.fn.stdpath('config')
local lang_root = CONFGIG_PATH .. '/lua/nxtaar/languages/'

local M = {}

M.plugins = {}
M.formatting = {}
M.servers = {}
M.ensure_installed = {}

for file in vim.fs.dir(lang_root) do
    local module = vim.fn.fnamemodify(file, ':r')
    local lang = require('nxtaar.languages.' .. module)

    for field, item in pairs(lang) do
        local field_type = type(field)

        if field == 'plugins' then
            M.plugins[#M.plugins + 1] = item
        elseif field == 'formatting' then
            M.formatting = vim.tbl_extend('force', M.formatting, item)
        elseif field_type == 'number' then
            M.servers[item] = {}
            M.ensure_installed[#M.ensure_installed + 1] = item
        elseif field_type == 'string' then
            M.servers[field] = item
            M.ensure_installed[#M.ensure_installed + 1] = field
        end
    end
end

return M
