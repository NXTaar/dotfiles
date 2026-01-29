local actions = require('nxtaar.config.actions')
local assignment = require('nxtaar.system.keymapping.assignment')

for _, action_config in pairs(actions) do
    if action_config.cmd ~= nil then
        vim.print(action_config)
        assignment(action_config, action_config.cmd):set_keymap()
    end
end

ACTIONS = actions

function with_actions(plugin)
    if plugin.keys == nil then
        return plugin
    end

    local mapped = {}

    for action_config, setup in pairs(plugin.keys) do
        local has_config = type(setup) == 'table'
        local handler = has_config and setup.handler or setup
        local prepared = assignment(action_config, handler)

        prepared.setup.ft = has_config and setup.ft or action_config.ft

        mapped[#mapped + 1] = prepared:to_lazy_keymap()
    end

    plugin.keys = mapped

    return plugin
end

function keymap_by_action(config, opts)
    opts = opts or {}
    for action_config, handler in pairs(config) do
        local prepared = assignment(action_config, handler)

        prepared.options = vim.tbl_deep_extend('force', prepared.options, opts)

        prepared:set_keymap()
    end
end
