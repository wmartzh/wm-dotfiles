
log_level = 'info'
--- [Global]
vim.g.have_nerd_font = true
-- [Options]
vim.o.number = true
vim.opt.termguicolors = true

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
-- Set line numbers
vim.opt.number = true         -- Show absolute number for the current line
vim.opt.relativenumber = true -- Show relative numbers for all other lines

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }


-- [Vim commans]

vim.cmd.colorscheme "tokyonight"

-- Define icons for diagnostic messages
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.notify = require("notify")
