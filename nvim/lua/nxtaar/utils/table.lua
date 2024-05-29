local M = {}

function M.tbl_find(tbl, comparator)
    local result = nil

    for key, value in pairs(tbl) do
        local comparison = comparator(value, key)

        if comparison then
            result = value
            break
        end
    end

    return result
end

function M.tbl_is_array(t)
    local i = 0
    for _ in pairs(t) do
        i = i + 1
        if t[i] == nil then return false end
    end
    return true
  end

return M
