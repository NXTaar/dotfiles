local palette = require('nxtaar.editor.statusline.constants.palette').palette
local M = {}

M.mode_icons = {
    normal = '',
    insert = '󰫶',
    replace = '',
    visual = '󰩬',
    command = '',
}

M.modes = {
    NORMAL = {
        icon = M.mode_icons.normal,
        palette = palette.normal,
        from = { 'n', 'niI', 'niR', 'niV', 'nt', 'ntT' },
    },
    O_PENDING = {
        icon = M.mode_icons.normal,
        palette = palette.normal,
        from = { 'no', 'nov', 'noV', 'no\22' },
    },
    CONFIRM = {
        icon = M.mode_icons.normal,
        palette = palette.normal,
        from = { 'r?' },
    },
    INSERT = {
        icon = M.mode_icons.insert,
        palette = palette.insert,
        from = { 'i', 'ic', 'ix' },
    },
    MORE = {
        icon = M.mode_icons.insert,
        palette = palette.insert,
        from = { 'rm' },
    },
    VISUAL = {
        icon = M.mode_icons.visual,
        palette = palette.visual,
        from = { 'v', 'vs' },
    },
    V_LINE = {
        icon = M.mode_icons.visual,
        palette = palette.visual,
        from = { 'V', 'Vs' },
    },
    V_BLOCK = {
        icon = M.mode_icons.visual,
        palette = palette.visual,
        from = { '\22', '\22s' },
    },
    SELECT = {
        icon = M.mode_icons.visual,
        palette = palette.visual,
        from = { 's' },
    },
    S_LINE = {
        icon = M.mode_icons.visual,
        palette = palette.visual,
        from = { 'S' },
    },
    S_BLOCK = {
        icon = M.mode_icons.visual,
        palette = palette.visual,
        from = { '\19' },
    },
    REPLACE = {
        icon = M.mode_icons.replace,
        palette = palette.replace,
        from = { 'R', 'Rc', 'Rx', 'r' },
    },
    V_REPLACE = {
        icon = M.mode_icons.replace,
        palette = palette.replace,
        from = { 'Rv', 'Rvc', 'Rvx' },
    },
    COMMAND = {
        icon = M.mode_icons.command,
        palette = palette.command,
        from = { 'c' },
    },
    EX = {
        icon = M.mode_icons.command,
        palette = palette.command,
        from = { 'cv', 'ce' },
    },
    SHELL = {
        icon = M.mode_icons.command,
        palette = palette.command,
        from = { '!' },
    },
    TERMINAL = {
        icon = M.mode_icons.command,
        palette = palette.command,
        from = { 't' },
    },
}

M.nvim_mode_2_mode_name_map = {}

for mode_name, mode_config in pairs(M.modes) do
    for _, vim_mode in ipairs(mode_config.from) do
        M.nvim_mode_2_mode_name_map[vim_mode] = mode_name
    end
end

return M
