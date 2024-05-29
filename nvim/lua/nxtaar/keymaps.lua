local actions = require('nxtaar.utils.action-names')
return {
    -- Clear highlighted selection
    { key = '<C-n>',  cmd = 'noh' },

    -- Split-screen navigation
    { key = '<C-h>',  to = '<C-w>h' },
    { key = '<C-j>',  to = '<C-w>j' },
    { key = '<C-k>',  to = '<C-w>k' },
    { key = '<C-l>',  to = '<C-w>l' },

    -- Version control
    { l_key = 'gg',   action = 'git.open-lazygit' },
    { l_key = 'gf',   action = 'git.open-fugitive' },
    { l_key = 'gtr',  action = 'git.open-flog-tree' },
    { l_key = 'dfo',  action = 'git.open-diff-view' },
    { l_key = 'dfc',  action = 'git.close-diff-view' },
    { l_key = 'gbl',  action = 'git.blame' },

    { l_key = 'u',    action = 'undo.toggle-tree' },

    -- Source file
    { l_key = 'sc',   cmd = ":source % | echo 'File '.expand('%').' sourced successfully'" },

    -- File navigation
    { l_key = 'f',    action = actions.SEARCH_FILE },
    { l_key = 'lg',   action = actions.SEARCH_GREP },
    { l_key = '-',    action = 'oil.open' },

    -- Projects
    { l_key = 'pr',   action = actions.PROJECTS_LIST },
    { l_key = 'pf',   action = actions.SEARCH_FILE_ALL_PROJECTS },
    { l_key = 'plg',  action = actions.SEARCH_GREP_ALL_PROJECTS },

    { l_key = 'yarn', cmd = 'vs|:term rm -rf node_modules && yarn' },

    -- LSP
    {
        key = 'K',
        action = 'lsp.show-hint',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = 'gd',
        action = 'lsp.go-to-definition',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = 'gD',
        action = 'lsp.go-to-declaration',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = 'gi',
        action = 'lsp.go-to-implementation',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = 'go',
        action = 'lsp.go-to-type-definition',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = 'gr',
        action = 'lsp.go-to-references',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = 'gs',
        action = 'lsp.signature-help',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        l_key = 'rn',
        action = 'lsp.rename',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = '<F3>',
        action = 'lsp.format-async',
        mode = { 'n', 'x' },
        silent = false,
        remap = false,
        buffer = true,
    },
    {
        l_key = 'x',
        action = 'lsp.code-action',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        l_key = 'i',
        action = 'lsp.show-info',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = '[d',
        action = 'lsp.diagnostic-go-to-prev',
        silent = false,
        remap = false,
        buffer = true
    },
    {
        key = ']d',
        action = 'lsp.diagnostic-go-to-next',
        silent = false,
        remap = false,
        buffer = true
    },
    { l_key = 'li',      action = 'lsp.show-lsp-info' },

    -- Typescript
    { l_key = 'ti',      action = 'typescript.add-missing-imports',                buffer = true },
    { l_key = 'tu',      action = 'typescript.remove-unused-imports',              buffer = true },

    -- Code completion
    { key = '<C-f>',     action = 'completion.scroll-down' },
    { key = '<C-d>',     action = 'completion.scroll-up' },
    { key = '<C-Space>', action = 'completion.complete' },
    { key = '<CR>',      action = 'completion.confirm' },
    { key = '<Tab>',     action = 'completion.smart-select-next' },
    { key = '<S-Tab>',   action = 'completion.smart-select-prev' },

    -- Buffers
    { l_key = 'bl',      action = actions.BUFFERS_OPEN_LIST },
    { l_key = 'bcl',     action = actions.BUFFERS_CLOSE_ALL_BUT_CURRENT },

    -- Navigation
    { l_key = '[',       action = 'navigation.go-to-previous' },
    { l_key = ']',       action = 'navigation.go-to-next' },
    { l_key = '{',       action = 'navigation.mark-file' },
    { l_key = '}',       action = 'navigation.toggle-menu' },
    { key = 'f',         action = 'navigation.line.next-symbol',                   mode = { 'n', 'x' } },
    { key = 'F',         action = 'navigation.line.previous-symbol',               mode = { 'n', 'x' } },
    { key = 't',         action = 'navigation.line.next-symbol-before-cursor',     mode = { 'n', 'x' } },
    { key = 'T',         action = 'navigation.line.previous-symbol-before-curson', mode = { 'n', 'x' } },
    { l_key = 'm',       action = 'navigation.hop-2chars',                         mode = { 'n', 'x' } },
    { l_key = 'hl',      action = 'navigation.hop-line',                           mode = { 'n', 'x' } },
    { l_key = 'hv',      action = 'navigation.hop-vertical',                       mode = { 'n', 'x' } },
    { l_key = 'w',       action = 'navigation.hop-word',                           mode = { 'n', 'x' } },
    { l_key = 'hp',      action = 'navigation.hop-pattern',                        mode = { 'n', 'x' } },

    -- Clean up SVG
    { l_key = 'svg',     to = ':silent !svgo --config ~/.svgoconfig %<CR>' },

    -- Problems
    { l_key = 'pp',      action = 'problems.show-in-file' },
    { l_key = 'pP',      action = 'problems.show-in-workspace' },
    { l_key = 'po',      action = 'problems.toggle' },

    { l_key = 'jt',      action = 'reformat.toggle' },
    { l_key = 'js',      action = 'reformat.split' },
    { l_key = 'jj',      action = 'reformat.join' },
    { key = '<C-q>',     to = '<C-\\><C-n>',                                       mode = { 't' } }
}
