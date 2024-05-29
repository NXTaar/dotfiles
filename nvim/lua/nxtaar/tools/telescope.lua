local actions = require('nxtaar.utils.action-names')

local M = {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
}


function M.config()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')
    local register_action = require('nxtaar.utils.actions').register_action
    local get_all_projects = require('nxtaar.tools.project').get_all_projects
    local pretty_buffers = require('nxtaar.tools.telescope_pretty_buffers')

    telescope.setup()
    telescope.load_extension('fzf')

    register_action('telescope.show-references', function()
        builtin.lsp_references(themes.get_ivy({ initial_mode = 'normal' }))
    end)

    register_keymap_action(actions.SEARCH_FILE, function()
        vim.fn.system('git rev-parse --is-inside-work-tree')

        if vim.v.shell_error == 0 then
            builtin.git_files()
        else
            builtin.find_files()
        end
    end)

    register_keymap_action(actions.BUFFERS_OPEN_LIST, pretty_buffers)

    register_keymap_action(actions.SEARCH_FILE_ALL_PROJECTS, function()
        builtin.find_files({ search_dirs = get_all_projects() })
    end)

    register_keymap_action(actions.SEARCH_GREP_ALL_PROJECTS, function()
        builtin.live_grep({ search_dirs = get_all_projects() })
    end)

    register_keymap_action(actions.SEARCH_GREP, function()
        builtin.live_grep()
    end)
end

return M
