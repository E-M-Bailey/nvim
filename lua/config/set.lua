-- Settings

local o = vim.opt

-- Numbers and Signs
o.number = true
o.relativenumber = true
o.signcolumn = "yes"

-- Tabs
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = false

-- Line Wrap
o.wrap = false

-- Search
o.hlsearch = true
o.incsearch = true

-- Scrolling
o.scrolloff = 10

-- Indentation
o.smartindent = true

-- Backup
o.swapfile = true
o.backup = false
o.updatetime = 1000

-- Undo
o.undodir = os.getenv('HOME') .. '/.vim/.undo'
o.undofile = true

-- Colors
o.termguicolors = true

