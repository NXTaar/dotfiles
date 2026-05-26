local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

local CACHE_PATH = vim.fn.stdpath('cache')

g.mapleader = ' '
g.maplocalleader = '\\'

-- File Handling
opt.autoread = true -- Automatically read changes from the file
opt.autowrite = true -- Automatically write changes to the file
opt.hidden = true -- Preserve closed buffers
opt.backup = false -- Disable file backups
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000 -- Maximum number of undo levels
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.winborder = 'rounded'

-- Formatting and Indentation
opt.softtabstop = 4
opt.smarttab = true
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.shiftround = true -- Round indent
opt.smartindent = true -- Insert indents automatically
opt.formatexpr = 'v:lua.require\'conform\'.formatexpr()' -- Format expression
opt.formatoptions = 'jcroqlnt' -- Formatting options

-- Folding
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Search and Navigation
opt.ignorecase = true -- Ignore case in searches
opt.smartcase = true -- Don't ignore case with capitals
opt.grepformat = '%f:%l:%c:%m' -- Grep output format
opt.grepprg = 'rg --vimgrep' -- Use ripgrep for grep
opt.inccommand = 'nosplit' -- Preview incremental substitute
opt.jumpoptions = 'view' -- Jump options
opt.scrolloff = 8 -- Lines of context around the cursor
opt.sidescrolloff = 8 -- Columns of context around the cursor

-- UI and Appearance
cmd('language en_US')
opt.guifont = 'SauceCodePro Nerd Font Mono'
opt.mouse = 'a' -- Enable mouse mode
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.ruler = false -- Disable the default ruler
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show invisible characters
opt.signcolumn = 'yes' -- Always show the signcolumn
opt.laststatus = 3 -- Global statusline
opt.showmode = false -- Don't show mode since we have a statusline
-- opt.statuscolumn = "v:lua.require'snacks.statuscolumn'.get()" -- Custom status column
opt.termguicolors = true -- True color support
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.wrap = false -- Disable line wrap
opt.winminwidth = 5 -- Minimum window width

-- Splits and Windows
opt.splitbelow = true -- Put new windows below the current
opt.splitright = true -- Put new windows to the right of the current
opt.splitkeep = 'screen' -- Keep the current screen view when splitting

-- Session and Buffer Management
opt.sessionoptions = {
    'buffers',
    'curdir',
    'tabpages',
    'winsize',
    'help',
    'globals',
    'skiprtp',
} -- Session options

-- Editing Enhancements
opt.completeopt = 'menu,menuone,noselect' -- Completion options
opt.confirm = true -- Confirm to save changes
opt.shortmess:append({ -- Suppress some messages
    W = true,
    I = true,
    c = true,
    C = true,
})
opt.virtualedit = 'block' -- Allow cursor beyond text in block mode
opt.timeoutlen = vim.g.vscode and 1000 or 400 -- Timeout for mappings and commands
opt.smoothscroll = true -- Smooth scrolling

-- Miscellaneous
opt.spelllang = { 'en' } -- Spellcheck language
opt.wildmode = 'longest:full,full' -- Command-line completion mode
