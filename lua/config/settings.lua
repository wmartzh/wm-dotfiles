local log_level = "info"

vim.o.clipboard = "unnamedplus"

--- [Global]
vim.g.have_nerd_font = true
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
	cache_enabled = 0,
}
-- vim.g.loaded_netrw = 1
-- cim.g.loaded_netrwPlugin = 1
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

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
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
	virtual_text = true, -- Set to true to see messages inline
	update_in_insert = false,
})

-- vim.notify = require("notify")

-- notify
-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
-- 	callback = function(ev)
-- 		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
-- 		vim.notify(vim.lsp.status(), "info", {
-- 			id = "lsp_progress",
-- 			title = "LSP Progress",
-- 			opts = function(notif)
-- 				notif.icon = ev.data.params.value.kind == "end" and " "
-- 					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
-- 			end,
-- 		})
-- 	end,
-- })
