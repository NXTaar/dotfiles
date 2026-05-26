local M = {}

local function noop() end

function M.component(setup)
    local render = setup.init or noop

    local children = nil

    setup.init = function(self)
        local render_result = render(self)

        if
            type(render_result) == 'table'
            and vim.tbl_count(render_result) > 0
        then
            children = self:new(render_result, 1)
        else
            children = nil
        end
    end

    setup.provider = function()
        if children ~= nil then
            return children:eval()
        end
    end

    return setup
end

return M
