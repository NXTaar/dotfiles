local CONFGIG_PATH = vim.fn.stdpath("config")
local lang_root = CONFGIG_PATH .. "/lua/nxtaar/lsp/languages/"

local M = {}

M.server_configs = {}
M.formatting = {}
M.ensure_installed_servers = {}

for file in vim.fs.dir(lang_root) do
    local lang = dofile(lang_root .. file)

    for server, config in pairs(lang) do
        if not (server == "formatting") then
            M.server_configs[server] = config
            M.ensure_installed_servers[#M.ensure_installed_servers + 1] = server
        else
            M.formatting = vim.tbl_extend("force", M.formatting, lang[server])
        end
    end
end

return M
