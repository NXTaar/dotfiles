local M = {}
local actions = {}

function M.register_action(key, callback)
    actions[key] = callback
end

function M.action(key)
    return function ()
        if actions[key] == nil then
            print('No action found for key: ' .. key)
            return
        end

        actions[key]()
    end
end

return M
