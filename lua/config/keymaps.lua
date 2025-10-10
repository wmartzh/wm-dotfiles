local opts = { noremap = true, silent = true }
local map = vim.keymap.set
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- Save file with <Ctrl>+s in Normal and Insert mode
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" })

-- Quit Neovim with <leader>qq in Normal mode
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Bufferline navigation
-- map("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
-- map("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
-- map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close Buffer" })
--- Buffers
map('n', '<leader>bn', '<Cmd>bnext<CR>', opts)
-- <Leader>bp -> Buffer Previous
map('n', '<Leader>bp', '<Cmd>bprevious<CR>', opts)
-- <leader>bl -> Buffer List
map('n', '<leader>bl', '<Cmd>ls<CR>', opts)
-- <leader>bd -> Buffer Delete (closes the current buffer)
map('n', '<leader>bd', '<Cmd>bdelete<CR>', opts)

-- LSP Diagnostic keymaps
map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>cel", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


map({ "n", "v" }, "<leader>f", function()
  require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end, { desc = "Format file or range (Conform)" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })


-- Mason
map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })
