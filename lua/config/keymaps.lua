local opts = { noremap = true, silent = true }
local map = vim.keymap.set
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Save file with <Ctrl>+s in Normal and Insert mode
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" })

-- Quit Neovim with <leader>qq in Normal mode
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Bufferline navigation
-- map("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
-- map("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
-- map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
--- Buffers
map("n", "<leader>bn", "<Cmd>bnext<CR>", opts)
-- <Leader>bp -> Buffer Previous
map("n", "<Leader>bp", "<Cmd>bprevious<CR>", opts)
-- <leader>bl -> Buffer List
map("n", "<leader>bl", "<Cmd>ls<CR>", opts)
-- <leader>bd -> Buffer Delete (closes the current buffer)
map("n", "<leader>bd", "<Cmd>bdelete<CR>", opts)

-- LSP Diagnostic keymaps (disabled: using CoC instead, see coc_config.lua)
-- map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
-- TS Pretty
vim.keymap.set("n", "<leader>ct", require("nvim-pretty-ts-errors").show_line_diagnostics)

map({ "n", "v" }, "<leader>f", function()
	require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 3000 })
end, { desc = "Format file or range (Conform)" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
end, { desc = "Next error/warning todo comment" })

-- Gi blame
map("n", "<Leader>gbb", "<Cmd>BlameToggle<CR>", opts)

-- Toggle Blink completion (alternative to CoC)
map("n", "<leader>tb", function()
	local blink_ok, lazy = pcall(require, "lazy")
	if not blink_ok then
		vim.notify("Lazy not found", vim.log.levels.ERROR)
		return
	end
	
	local blink_spec = lazy.plugins()["blink.cmp"]
	if not blink_spec then
		vim.notify("Blink.cmp not installed", vim.log.levels.ERROR)
		return
	end
	
	local enabled = blink_spec.enabled
	blink_spec.enabled = not enabled
	
	-- Reload blink
	require("lazy").reload({ plugins = "blink.cmp" })
	
	local status = blink_spec.enabled and "enabled" or "disabled"
	vim.notify("Blink.cmp " .. status, vim.log.levels.INFO)
end, { desc = "Toggle Blink completion (CoC is default)" })
