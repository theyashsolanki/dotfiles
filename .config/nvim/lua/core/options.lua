local opt = vim.opt

-- disable intro
opt.shortmess:append("sI")

-- remove ~
vim.opt.fillchars = { eob = " " }

-- set leader key
vim.g.mapleader = " "

-- vim.g.transparency = 0.5
vim.opt.laststatus = 3

opt.showmode = false
opt.ruler = false

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.wrap = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

opt.scrolloff = 8

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split
opt.splitright = true
opt.splitbelow = true

-- iclude "-" as a word
opt.iskeyword:append("-")

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.undofile = true

-- highlight yanked text
vim.cmd([[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=200}
  augroup END
]])

vim.cmd([[
set nocompatible
filetype plugin on
syntax on
]])

vim.cmd([[

let g:vimwiki_list = [{'path': '~/personal/vimwiki/',
                      \ }]
]])

vim.g.skip_ts_context_commentstring_module = true
