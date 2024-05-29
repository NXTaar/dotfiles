local languages = require('nxtaar.lsp.lang_list')

local servers = {}

for _, lang in ipairs(languages) do
    if (lang.autoformat_files) then
        servers[lang.server] = lang.autoformat_files
    end
end

return {
    format_opts = {
        async = true,
        timeout_ms = 10000
    },
    servers = servers
}
