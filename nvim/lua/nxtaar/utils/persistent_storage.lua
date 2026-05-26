local Path = require('plenary.path')
local PersistentStorage = {}
local storage_root = vim.fn.stdpath('data')

function PersistentStorage:update(state_update)
    self.state = vim.tbl_extend('force', self.state or {}, state_update)
    self:persist()
end

function PersistentStorage:replace(replacement)
    self.state = replacement or self.state
    self:persist()
end

function PersistentStorage:persist()
    local content = vim.tbl_isempty(self.state) and '{}'
        or vim.json.encode(self.state)

    self.path:write(content, 'w')
end

function PersistentStorage:sync()
    self.state = vim.json.decode(self.path:read())
end

function PersistentStorage:delete(key)
    self.state[key] = nil
    self:persist()
end

function PersistentStorage:get(key)
    return self.state[key]
end

local constructor = function(name, default_state)
    local instance = vim.deepcopy(PersistentStorage)

    instance.path = Path:new(vim.fs.joinpath(storage_root, name .. '.json'))

    if instance.path:exists() then
        instance:sync()
    else
        instance:update(default_state or {})
    end

    return instance
end

return constructor
