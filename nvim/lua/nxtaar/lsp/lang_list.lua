local tbl_is_array = require('nxtaar.utils.table').tbl_is_array
local CONFGIG_PATH = vim.fn.stdpath('config')
local lang_root = CONFGIG_PATH .. '/lua/nxtaar/lsp/languages/'

local list = {}

for file in vim.fs.dir(lang_root) do
    local lang = dofile(lang_root .. file)

    if (lang.server) then
        list[#list + 1] = lang
    end

    if tbl_is_array(lang) then
        for _, nested_lang in ipairs(lang) do
            list[#list + 1] = nested_lang
        end
    end
end

return list
