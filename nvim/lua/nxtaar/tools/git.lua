local cmd = vim.cmd

local function fugitive()
    local GSTATUS_HEIGHT = 20

    register_keymap_action('git.open-fugitive', function()
        cmd('Git')
        cmd(GSTATUS_HEIGHT .. 'wincmd_')
    end)

    register_keymap_action('git.blame', 'Git blame', 'cmd')
end

local function flog()
    register_keymap_action('git.open-flog-tree', 'Flog -all', 'cmd')
end

local function lazygit()
    register_keymap_action('git.open-lazygit', 'LazyGit', 'cmd')
end

local function diffview(_plugin, opts)
    local dv = require('diffview')
    dv.setup(opts)

    register_keymap_action('git.open-diff-view', 'DiffviewOpen', 'cmd')
    register_keymap_action('git.close-diff-view', 'DiffviewClose', 'cmd')
end

local M = {
    { 'tpope/vim-fugitive', config = fugitive },
    { 'rbong/vim-flog',     config = flog },
    {
        'sindrets/diffview.nvim',
        opts = {
            view = {
                merge_tool = {
                    layout = 'diff3_mixed'
                }
            }
        },
        config = diffview
    },
    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = lazygit
    },
}

return M
