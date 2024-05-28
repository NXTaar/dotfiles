local colors = {
    active = {
        bg = '#88c0d0',
        text = '#191d24'
    },
    idle = {
        bg = '#1e222a',
        text = '#bbc3d4'
    }
}

local M = {
    colors = colors
}

function M.apply_config(config)
    config.color_scheme = 'nord'
end

return M
