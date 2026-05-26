local actions = require('nxtaar.utils.action-names')

local M = {
    'coffebar/neovim-project',
    opts = {
        projects = { -- define project roots
            '~/Projects/tochka/*',
            '~/Projects/other/dotfiles',
            '~/Projects/other/sgt-telegram',
            '~/Projects/other/telescope*'
        },
        last_session_on_startup = false
    },
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append('globals') -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
}

function M.get_all_projects()
    return require('neovim-project.utils.path').get_all_projects()
end

function M.config(_, opts)
    local pr = require('neovim-project')
    pr.setup(opts)

    register_keymap_action(actions.PROJECTS_LIST, 'Telescope neovim-project discover')
end

return M
