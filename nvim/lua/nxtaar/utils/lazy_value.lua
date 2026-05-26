local class = require('middleclass')

local M = {
    LazyValue = class('LazyValue'),
    LazyStorage = class('LazyStorage'),
}

function M.LazyValue:initialize(factory)
    self.factory = factory
    self.cached = nil
end

function M.LazyValue:get(params)
    if self.cached == nil then
        self.cached = self.factory(params)
    end

    return self.cached
end

function M.LazyStorage:initialize(factory)
    self.factory = factory
    self.storage = {}
end

function M.LazyStorage:get(field)
    if self.storage[field] == nil then
        self.storage[field] = self.factory(field)
    end

    return self.storage[field]
end

return M
