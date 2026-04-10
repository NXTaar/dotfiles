local Repo = require('nxtaar.editor.workspaces.repo')

local opts = {
    picker = {
        type = 'snacks',
    },
    last_session_on_startup = false,
}

local function setup_plugin()
    local list = {}

    for _, path in pairs(Repo.state()) do
        list[#list + 1] = path
    end

    local updated_opts = vim.tbl_extend('force', opts, { projects = list })

    require('neovim-project').setup(updated_opts)
end

vim.api.nvim_create_user_command('WorkspaceAdd', function()
    local repo = Repo:new(vim.fn.expand('%:p'))

    if repo == nil then
        vim.notify('No repo to add to the workspace', vim.log.levels.WARN)
        return
    end

    repo:add()
    setup_plugin()
end, { nargs = 0 })

vim.api.nvim_create_user_command('WorkspaceRemove', function()
    local repo = Repo:new(vim.fn.expand('%:p'))

    if repo == nil then
        vim.notify('No repo to remove from the workspace', vim.log.levels.WARN)
        return
    end

    repo:remove()
    setup_plugin()
end, { nargs = 0 })

return with_actions({
    'coffebar/neovim-project',
    lazy = false,
    priority = 100,
    dependencies = {
        { 'Shatur/neovim-session-manager' },
    },
    config = setup_plugin,
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append('globals') -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    keys = {
        [ACTIONS.WORKSPACE_DISCOVER_PROJECTS] = function()
            require('neovim-project.project').discover_projects()
        end,
    },
})
