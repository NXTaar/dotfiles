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
    OPEN_BUFFER_LIST = {
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
    OPEN_GIT = {
        desc = 'Open Git client',
        l_key = 'gg',
    },
    OPEN_GIT_LOG = {
        desc = 'Open logged Git commits',
        l_key = 'gl',
    },
    OPEN_GIT_BRANCHES = {
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
    LSP_REFERENCES_SHOW = {
        desc = 'Show references (usages) of the item',
        key = 'gr',
    },
    DIAGNOSTICS_SHOW = {
        desc = 'Show file\'s errors and warnings',
        key = 'gp',
    },
    WORKSPACE_DISCOVER_PROJECTS = {
        desc = 'Show the list of the added projects to the workspace',
        l_key = 'pr',
    },
}
