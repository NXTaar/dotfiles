local create_component = require('lualine.component')
local Component = create_component:extend()

local opts = {
    icon = {
        '',
        color = 'Directory',
    },
    separator = {
        left = '',
        right = ' ',
    },
    padding = {
        left = 1,
        right = 0,
    },
}

function Component:init(options)
    self.super.init(self, vim.tbl_extend('force', opts, options))
    self.cache = {}
end

function Component:update_status()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == '' then
        return ''
    end

    if self.cache[bufname] ~= nil then
        return self.cache[bufname]
    end

    local root = vim.fs.root(bufname, '.git')

    if not root or root == '.' then
        return ''
    end

    local repo = vim.fn.fnamemodify(root, ':t')

    self.cache[bufname] = repo

    return repo
end

return Component
