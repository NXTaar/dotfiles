return with_actions({
    'stevearc/overseer.nvim',
    opts = {
        template_dirs = {
            'nxtaar.tasks',
        },
        templates = {
            'remove_node_modules',
            'yarn_install',
            'reinstall_node_modules',
        },
    },
    keys = {
        [ACTIONS.TASK_RUNNER_OVERVIEW_OPEN] = function()
            require('overseer').toggle({ enter = true })
        end,
        [ACTIONS.TASK_RUNNER_RUN_TASK] = 'OverseerRun',
    },
})
