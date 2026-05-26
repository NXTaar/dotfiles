---@class Action
---@field desc string Description of what the action does
---@field l_key? string Leader key combination for the action (optional)
---@field key? string Regular key combination for the action (optional)
---@field mode? string Vim mode in which the action applies (optional)
---@field cmd? string Command to execute when the action is triggered (optional)

---@class Actions
---@field [string] Action

---@type Actions
return {
    OPEN_FILE_TREE = {
        desc = 'Open files tree',
        l_key = '-',
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
        cmd = 'source %',
    },
    OPEN_GIT = {
        desc = 'Open Git client',
        l_key = 'gg',
    },
}
