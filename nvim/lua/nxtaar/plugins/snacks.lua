return with_actions({
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        lazygit = { enabled = true },
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        image = { enabled = true },
        -- dashboard = { enabled = true },
        -- explorer = { enabled = true },
        -- indent = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                files = {
                    hidden = true,
                    ignored = true,
                    exclude = {
                        "node_modules",
                        ".git",
                        ".venv",
                        "__pycache__",
                        ".next",
                        "dist",
                        "build",
                    },
                },
            },
        },
        -- notifier = { enabled = true },
        -- quickfile = { enabled = true },
        -- scope = { enabled = true },
        scroll = { enabled = true },
        -- statuscolumn = { enabled = true },
        -- words = { enabled = true },
    },
    keys = {
        [ACTIONS.OPEN_FILE_SEARCH] = function()
            Snacks.picker.files()
        end,
        [ACTIONS.BUFFERS_LIST_OPEN] = function()
            Snacks.picker.buffers()
        end,
        [ACTIONS.OPEN_CLIPBOARD_REGISTRIES] = function()
            Snacks.picker.registers()
        end,
        [ACTIONS.GIT_BRANCHES_OPEN] = function()
            Snacks.picker.git_branches({ all = true })
        end,
        [ACTIONS.GIT_CLIENT_OPEN] = function()
            Snacks.lazygit()
        end,
        [ACTIONS.GIT_LOG_OPEN] = function()
            Snacks.lazygit.log()
        end,
        [ACTIONS.SEARCH_GREP] = function()
            Snacks.picker.grep()
        end,
        [ACTIONS.SEARCH_GREP_WORD] = function()
            Snacks.picker.grep_word()
        end,
        [ACTIONS.BUFFERS_CLOSE_OTHER] = function()
            Snacks.bufdelete.other()
        end,
        [ACTIONS.OPEN_WORKSPACE_FILE_SEARCH] = function()
            local state = require('nxtaar.editor.workspaces.repo').state()
            local dirs = {}

            for _, path in pairs(state) do
                dirs[#dirs + 1] = path
            end

            if #dirs == 0 then
                vim.notify('No workspaces registered', vim.log.levels.WARN)
                return
            end

            Snacks.picker.files({ dirs = dirs })
        end,
        [ACTIONS.HIGHLIGHT_GROUPS_LIST_OPEN] = function()
            Snacks.picker.highlights()
        end,
    },
})
