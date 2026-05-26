local keymap_assignment = {}

function keymap_assignment:set_keymap(handler)
    local rhs = self.setup.rhs or handler
    vim.keymap.set(self.setup.mode, self.setup.lhs, rhs, self.options)
end

function keymap_assignment:to_lazy_keymap()
    return {
        self.setup.lhs,
        self.setup.rhs,
        ft = self.setup.ft,
        mode = self.setup.mode,
        silent = self.options.silent,
        desc = self.options.desc,
        remap = self.options.remap,
        buffer = self.options.buffer,
    }
end

local function cmd_cb(cmd)
    return function()
        vim.cmd(cmd)
    end
end

return function(config, handler)
    local instance = vim.deepcopy(keymap_assignment)

    instance.setup = {
        mode = config.mode or 'n',
        ft = config.ft or nil,
        lhs = config.l_key and '<leader>' .. config.l_key or config.key,
        rhs = type(handler) == 'string' and cmd_cb(handler) or handler,
    }

    instance.options = {
        silent = config.silent or true,
        remap = config.remap or true,
        buffer = config.buffer or false,
        desc = config.desc,
    }

    return instance
end
