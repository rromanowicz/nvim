local opt = vim.opt

-- Visual
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.list = true
opt.listchars = { tab = "> " }
vim.o.showtabline = 2

-- Tab / Indent
opt.tabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2

-- Encoding
opt.encoding = "utf-8"

-- Spell check
opt.spell = true
opt.spelllang = { "en", "cjk" }

-- Completion
opt.pumheight = 15
opt.pumblend = 15

opt.syntax = "on"

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- undo
opt.undofile = true

opt.autoread = true

opt.termguicolors = true

vim.g.mapleader = " "

require("plugins.theme")

vim.diagnostic.config({ virtual_lines = true })

opt.clipboard = 'unnamedplus'
