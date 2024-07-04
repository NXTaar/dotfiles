local cmd          = vim.cmd
local opt          = vim.opt
local g            = vim.g

local CACHE_PATH   = vim.fn.stdpath('cache')

opt.cmdheight      = 0

-- UI Font
vim.o.guifont      = 'SauceCodePro Nerd Font Mono'

-- preserve closed buffers
opt.hidden         = true

-- Color settings
opt.termguicolors  = true
opt.background     = 'dark'

-- Show line numbers
opt.number         = true
opt.relativenumber = true
opt.signcolumn     = 'yes'

-- Indentation
-- more info here https://habr.com/ru/articles/64224/
opt.tabstop        = 4
opt.softtabstop    = 4
opt.shiftwidth     = 4
opt.expandtab      = true
opt.smarttab       = true
opt.smartindent    = true

-- Long words wrapping
opt.wrap           = true
opt.linebreak      = true

-- Space as leader key
g.mapleader        = ' '
g.maplocalleader   = ' '

-- Backup settings
opt.swapfile       = false
opt.backup         = false
opt.undofile       = true
opt.undodir        = CACHE_PATH .. '/undo'

-- Search
opt.incsearch      = true
opt.hlsearch       = true

-- Folding
opt.foldlevel      = 20
opt.foldmethod     = 'expr'
opt.foldenable     = false
opt.foldexpr       = 'nvim_treesitter#foldexpr()'

-- Window split
opt.splitright     = true

-- Scroll
opt.scrolloff      = 8

-- Popups transparency
vim.opt.winblend   = 5
vim.opt.pumblend   = 5

-- Encoding
opt.fileencoding   = 'utf-8'

-- Define what is a part of a word
opt.iskeyword:append { '-' }
opt.iskeyword:remove { ':' }

-- Substitude highlights and changes on the fly
opt.inccommand = 'split'

-- Session file
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- UI language
cmd('language en_US')
