local CONFGIG_PATH = vim.fn.stdpath('config')

vim.api.nvim_create_user_command('Keymaps', function()
    vim.cmd('e ' .. CONFGIG_PATH .. '/lua/nxtaar/keymaps.lua')
end, { nargs = 0 })

vim.api.nvim_create_user_command('Commands', function()
    vim.cmd('e ' .. CONFGIG_PATH .. '/lua/nxtaar/commands.lua')
end, { nargs = 0 })

vim.api.nvim_create_user_command('Plugins', function()
    vim.cmd('e ' .. CONFGIG_PATH .. '/lua/nxtaar/plugins.lua')
end, { nargs = 0 })

vim.api.nvim_create_user_command('LspSettings', function()
    vim.cmd('e ' .. CONFGIG_PATH .. '/lua/nxtaar/lsp_settings.lua')
end, { nargs = 0 })
