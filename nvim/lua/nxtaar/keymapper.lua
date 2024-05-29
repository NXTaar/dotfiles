local keymaps = require('nxtaar.keymaps')

local M = {}
local actions = {}

local function cmd_cb(cmd)
    return function()
        vim.cmd(cmd)
    end
end

local function assign_keymap(config)
    local mode = config.mode or 'n'
    local silent = config.silent or true
    local buffer = config.buffer or false
    local remap = config.remap or true
    local key = config.l_key and '<leader>' .. config.l_key or config.key
    local output = nil

    local options = {
        silent = silent,
        remap = remap,
        buffer = buffer
    }

    if config.cmd then
        output = cmd_cb(config.cmd)
    end

    if config.callback then
        output = config.callback
    end

    if config.to then
        output = config.to
    end

    if config.action then
        actions[config.action] = { key = key, options = options, mode = mode }
        return
    end

    vim.keymap.set(mode, key, output, options)
end

for _, keymap_config in ipairs(keymaps) do
    assign_keymap(keymap_config)
end

function register_keymap_action(action, cb, type)
    if actions[action] == nil then
        print('No keymaps for action: ' .. action)
        return
    end

    local output = cb

    if type == 'cmd' then
        output = cmd_cb(cb)
    end

    local config = actions[action]

    vim.keymap.set(config.mode, config.key, output, config.options)
end

function get_keymap_config_for_action(action)
    if actions[action] == nil then
        print('No keymap config for action: ' .. action)
        return
    end

    return actions[action]
end

return M
