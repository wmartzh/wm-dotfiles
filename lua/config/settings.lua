--- [Global]
vim.g.have_nerd_font = true
vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "macOS-clipboard",
	copy = {
		["+"] = "pbcopy",
		["*"] = "pbcopy",
	},
	paste = {
		["+"] = "pbpaste",
		["*"] = "pbpaste",
	},
	cache_enabled = 1,
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true

-- [Options]

-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.cursorline = true
-- Set line numbers
vim.o.number = true
vim.opt.relativenumber = true -- Show relative numbers for all other lines
-- Set a single column at 100 characters
vim.opt.colorcolumn = "100"

-- Swap and split behavior
vim.o.swapfile = false 
vim.o.splitbelow = true
vim.o.splitright = true

-- Mouse support
vim.o.mouse = "a"

-- Scrolloff for better context
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"
-- Create dir if not exist
vim.fn.mkdir(vim.o.undodir, "p")

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "auto:2"

-- Decrease update time
vim.o.updatetime = 300

-- Matchparen performance (reduce timeout in insert mode)
vim.g.matchparen_timeout = 100
vim.g.matchparen_insert_timeout = 30

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding (using native treesitter folding - faster than nvim-treesitter)
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- [Vim commans]

vim.cmd.colorscheme("tokyonight")

-- Define icons for diagnostic messages
local signs = {
	Error = { icon = " ", hl = "DiagnosticSignError" },
	Warn = { icon = " ", hl = "DiagnosticSignWarn" },
	Info = { icon = " ", hl = "DiagnosticSignInfo" },
	Hint = { icon = " ", hl = "DiagnosticSignHint" }, -- Using your specific hint icon
}

--
-- Configure the diagnostic system to use your signs and highlights
vim.diagnostic.config({
	signs = {
		active = true,
		-- Set the icon text for each severity
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error.icon,
			[vim.diagnostic.severity.WARN] = signs.Warn.icon,
			[vim.diagnostic.severity.INFO] = signs.Info.icon,
			[vim.diagnostic.severity.HINT] = signs.Hint.icon,
		},
		-- Set the highlight for the line number, replicating your `numhl = hl`
		numhl = {
			[vim.diagnostic.severity.ERROR] = signs.Error.hl,
			[vim.diagnostic.severity.WARN] = signs.Warn.hl,
			[vim.diagnostic.severity.INFO] = signs.Info.hl,
			[vim.diagnostic.severity.HINT] = signs.Hint.hl,
		},
	},
	-- You can configure other diagnostic features here as well
	underline = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN }, -- Only show warnings and errors
		source = "if_many", -- Show source if multiple providers
	},
	update_in_insert = false,
})

-- require("config.harpoon_config")

-- Filetype detection for lex/yacc
vim.filetype.add({
	extension = {
		l = "lex",
		y = "yacc",
	},
})
