---@class Action
---@field desc string Description of what the action does
---@field l_key? string Leader key combination for the action (optional)
---@field key? string Regular key combination for the action (optional)
---@field mode? string Vim mode in which the action applies (optional)
---@field cmd? string Command to execute when the action is triggered (optional)
---@field to? string Sequence to execute instead (optional)

---@class Actions
---@field [string] Action

---@type Actions
return {
    OPEN_FILE_TREE = {
        desc = 'Open files tree',
        l_key = '-',
    },
    BUFFERS_LIST_OPEN = {
        desc = 'List with current opened buffers',
        l_key = 'bl',
    },
    OPEN_CLIPBOARD_REGISTRIES = {
        desc = 'List with clipboard registries',
        l_key = 'rl',
    },
    REFORMAT_STRUCTURE_SPLIT = {
        desc = 'Split object to different lines',
        l_key = 'js',
    },
    REFORMAT_STRUCTURE_JOIN = {
        desc = 'Join object to single line',
        l_key = 'jj',
    },
    REFORMAT_STRUCTURE_TOGGLE = {
        desc = 'Toggle object appereance to single/multiple lines',
        l_key = 'jt',
    },
    OPEN_FILE_SEARCH = {
        desc = 'Open files search',
        l_key = 'f',
        mode = 'n',
    },
    OPEN_PACKAGE_MANAGER = {
        desc = 'Open package manager window',
        l_key = '.',
        cmd = 'Lazy',
    },
    SEARCH_HIGHLIGHT_OFF = {
        desc = 'Turn off search highlight',
        key = '<C-n>',
        cmd = 'noh',
    },
    MOVEMENT_JUMP = {
        desc = 'Jump to symbol',
        key = 'gw',
    },
    MOVEMENT_TREESITTER = {
        desc = 'Jump to Tresitter symbol',
        key = 'gt',
    },
    SOURCE_CURRENT_FILE = {
        desc = 'Execute code in the current file',
        l_key = 'sc',
        cmd = ':source % | echo \'File \'.expand(\'%\').\' sourced successfully\'',
    },
    GIT_CLIENT_OPEN = {
        desc = 'Open Git client',
        l_key = 'gg',
    },
    GIT_LOG_OPEN = {
        desc = 'Open logged Git commits',
        l_key = 'gl',
    },
    GIT_BRANCHES_OPEN = {
        desc = 'Open list with all Git branches of the repository',
        l_key = 'gb',
    },
    NAVIGATE_LEFT_SPLIT = {
        desc = 'Navigate to the left split from current',
        key = '<C-h>',
        to = '<C-w>h',
    },
    NAVIGATE_DOWN_SPLIT = {
        desc = 'Navigate to the down split from current',
        key = '<C-j>',
        to = '<C-w>j',
    },
    NAVIGATE_UP_SPLIT = {
        desc = 'Navigate to the up split from current',
        key = '<C-k>',
        to = '<C-w>k',
    },
    NAVIGATE_RIGHT_SPLIT = {
        desc = 'Navigate to the right split from current',
        key = '<C-l>',
        to = '<C-w>l',
    },
    SEARCH_GREP = {
        desc = 'Search substring in files',
        l_key = 's',
    },
    SEARCH_GREP_WORD = {
        desc = 'Search current word/selection in files',
        key = 'gs',
    },
    LSP_AVAILABLE_ACTIONS_SHOW = {
        desc = 'Execute suggested LSP action',
        key = 'gx',
    },
    LSP_REFERENCES_SHOW = {
        desc = 'Show references (usages) of the item',
        key = 'gr',
    },
    LSP_GOTO_DEFINITION = {
        desc = 'Go to the definition of the symbol',
        key = 'gd',
    },
    LSP_SHOW_INFO = {
        desc = 'Show info about the item',
        key = 'gi',
    },
    LSP_RESTART_SERVERS = {
        desc = 'Restart LSP-servers, f.e. when the file structure or dependencies change',
        l_key = 'glr',
    },
    DIAGNOSTICS_SHOW = {
        desc = 'Show file\'s errors and warnings',
        key = 'gp',
    },
    WORKSPACE_DISCOVER_PROJECTS = {
        desc = 'Show the list of the added projects to the workspace',
        l_key = 'pr',
    },
    TASK_RUNNER_OVERVIEW_OPEN = {
        desc = 'Open overview window with current tasks',
        l_key = 'tt',
    },
    TASK_RUNNER_RUN_TASK = {
        desc = 'Run a task with the task runner',
        l_key = 'tr',
    },
    BUFFERS_CLOSE_OTHER = {
        desc = 'Close all buffers except the current one',
        l_key = 'bcl',
    },
    HIGHLIGHT_GROUPS_LIST_OPEN = {
        desc = 'Open a preview for all highlight groups',
        l_key = 'hl',
    },
}
