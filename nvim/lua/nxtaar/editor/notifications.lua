local notify = require('notify')

local function set_notify_colors(level, config)
    local level_uppercased = string.upper(level)

    if config.border then
        vim.api.nvim_set_hl(
            0, 'Notify' .. level_uppercased .. 'Border',
            config.border
        )
    end

    if config.icon then
        vim.api.nvim_set_hl(
            0, 'Notify' .. level_uppercased .. 'Icon',
            config.icon
        )
    end

    if config.title then
        vim.api.nvim_set_hl(
            0, 'Notify' .. level_uppercased .. 'Title',
            config.title
        )
    end
end

set_notify_colors('info', {
    border = { link = 'NonText' },
    icon = { link = 'LspDiagnosticsSignInformation' },
    title = { link = 'LspDiagnosticsSignInformation' }
})

notify.setup({
    stages = 'fade',
    level = 0
})

local M = {
    'rcarriga/nvim-notify',
}

-- local function config_defaults(config)
--     if not config.timeout then
--         config.timeout = 200
--     end

--     if not config.render then
--         config.render = 'compact'
--     end

--     return config
-- end

-- function M.info(message, config)
--     notify(message, 'info', config_defaults(config));
-- end

return M
