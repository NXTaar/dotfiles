local class = require('middleclass')

local USER_EVENT = 'User'

local function split_tbl_autocmd_config(tbl)
    local foundString = (type(tbl[1]) == 'string') and tbl[1] or nil
    local restTable = {}

    -- Copy all named properties
    for key, value in pairs(tbl) do
        if type(key) ~= 'number' then
            restTable[key] = value
        end
    end

    return foundString, restTable
end

local function normalize_event_config(input)
    local config
    local input_type = type(input)

    if input_type == 'string' then
        config = {
            input,
        }
    end

    if input_type == 'table' then
        config = input
    end

    if config == nil then
        error('EventEmitter: Invalid config')
    end

    return config
end

local EventEmitter = class('AutocmdMerge')

function EventEmitter:emit(event, data)
    local opts = {
        pattern = event,
    }

    if data ~= nil then
        opts.data = data
    end

    vim.api.nvim_exec_autocmds(USER_EVENT, opts)
end

function EventEmitter:on(event, opts)
    local id = vim.api.nvim_create_autocmd(event, opts)

    return function()
        vim.api.nvim_del_autocmd(id)
    end
end

function EventEmitter:on_merged(event, setup)
    local setup_type = type(setup)
    local opts = {
        pattern = event,
    }

    if setup_type == 'function' then
        opts.callback = setup
    end

    if setup_type == 'table' then
        opts = vim.tbl_extend('force', opts, setup)
    end

    return self:on(USER_EVENT, opts)
end

function EventEmitter:user_event(event, setup)
    local setup_type = type(setup)
    local opts = {
        pattern = event,
    }

    if setup_type == 'function' then
        opts.callback = setup
    end

    if setup_type == 'table' then
        opts = vim.tbl_extend('force', opts, setup)
    end

    opts[1] = USER_EVENT

    return opts
end

function EventEmitter:merge_autocmds(into, autocmds)
    local merge_autocmd_group = 'autocmd_merge_' .. into
    local group =
        vim.api.nvim_create_augroup(merge_autocmd_group, { clear = true })

    local merge_options = {
        group = group,
        callback = function(event)
            self:emit(into, event)
        end,
    }

    for _, value in pairs(autocmds) do
        local autocmd_setup = normalize_event_config(value)
        local autocmd, opts = split_tbl_autocmd_config(autocmd_setup)

        if autocmd == nil then
            error('EventEmitter: No autocmd name was provided to merge')
        end

        self:on(autocmd, vim.tbl_extend('force', opts, merge_options))
    end

    return function()
        vim.api.nvim_del_augroup_by_name(merge_autocmd_group)
    end
end

return EventEmitter:new()
