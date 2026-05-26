local create_storage = require('nxtaar.utils.persistent_storage')
local storage = create_storage('workspaces')

local Repo = {}
Repo.__index = Repo

function Repo.state()
    return storage.state
end

-- Constructor
function Repo:new(path)
    local instance = setmetatable({}, self)

    if type(path) ~= 'string' or #path == 0 then return nil end

    local root = vim.fs.root(path, '.git')

    if root == nil then return nil end

    instance.path = root
    instance.name = vim.fn.fnamemodify(root, ':t')

    return instance
end

function Repo:add()
    local answer = vim.fn.confirm(self.name .. ' - Add this repo to the workspace?', '&Yes\n&No', 2, 'Question')

    if answer ~= 1 then return end

    storage:update({ [self.name] = self.path })

    vim.notify('Repo ' .. self.name .. ' has been added to the workspace', vim.log.levels.INFO)
end

function Repo:remove()
    local answer = vim.fn.confirm(self.name .. ' - Remove this repo from the workspace?', '&Yes\n&No', 2, 'Question')

    if answer ~= 1 then return end

    storage:delete(self.name)

    vim.notify('Repo ' .. self.name .. 'has been removed from the workspace', vim.log.levels.INFO)
end

return Repo
