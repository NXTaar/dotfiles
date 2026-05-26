local M = {}

M.palette = {
    normal = 'normal',
    insert = 'insert',
    replace = 'replace',
    visual = 'visual',
    command = 'command',
    bg_primary = 'bg_primary',
    bg_secondary = 'bg_secondary',
    text = 'text',
}

M.palette_extract_info = {
    [M.palette.normal] = {
        { 'TabLineSel', 'PmenuSel', 'PmenuThumb' },
        'bg',
    },
    [M.palette.insert] = {
        { 'String', 'MoreMsg' },
        'fg',
    },
    [M.palette.replace] = {
        { 'Number', 'Type' },
        'fg',
    },
    [M.palette.visual] = {
        { 'Special', 'Boolean', 'Constant' },
        'fg',
    },
    [M.palette.command] = {
        { 'Identifier' },
        'fg',
    },
    [M.palette.bg_primary] = {
        { 'Normal', 'StatusLineNC' },
        'bg',
    },
    [M.palette.bg_secondary] = {
        { 'Normal', 'StatusLine' },
        'fg',
    },
    [M.palette.text] = {
        { 'StatusLine' },
        'bg',
    },
}

return M
