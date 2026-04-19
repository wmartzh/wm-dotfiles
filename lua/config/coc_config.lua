-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua
---@diagnostic disable: undefined-global

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set

-- Autocomplete
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
local opts_expr = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts_expr)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts_expr)

-- Make <CR> to accept selected completion item
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts_expr)

-- Snippets and completion trigger
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)", { desc = "Expand snippet" })
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true, desc = "Trigger completion" })

-- Diagnostic navigation
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true, desc = "Previous diagnostic" })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true, desc = "Next diagnostic" })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true, desc = "Go to definition" })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true, desc = "Go to type definition" })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true, desc = "Go to implementation" })
-- gr handled by telescope-coc (see telescope.lua)

-- Use K to show documentation in preview window
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true, desc = "Show documentation" })

-- Highlight the symbol and its references on a CursorHold event
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
	group = "CocGroup",
	command = "silent call CocActionAsync('highlight')",
	desc = "Highlight symbol under cursor on CursorHold",
})

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true, desc = "Rename symbol" })

-- Formatting
keyset("n", "<leader>cf", function()
	vim.fn.CocActionAsync('runCommand', 'editor.action.formatDocument')
end, { silent = true, desc = "Format document (CoC)" })

-- Code actions
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true, desc = "Code action (selected)" })
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true, desc = "Code action (selected)" })
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true, nowait = true, desc = "Code action (cursor)" })
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", { silent = true, nowait = true, desc = "Code action (source)" })
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true, nowait = true, desc = "Quick fix" })

-- Refactor actions
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true, desc = "Refactor" })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true, desc = "Refactor (selected)" })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true, desc = "Refactor (selected)" })

-- Code lens
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true, nowait = true, desc = "Code lens action" })

-- Text objects for functions and classes
keyset("x", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true, desc = "Inside function" })
keyset("o", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true, desc = "Inside function" })
keyset("x", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true, desc = "Around function" })
keyset("o", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true, desc = "Around function" })
keyset("x", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true, desc = "Inside class" })
keyset("o", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true, desc = "Inside class" })
keyset("x", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true, desc = "Around class" })
keyset("o", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true, desc = "Around class" })

-- Scroll float windows/popups
local opts_scroll = { silent = true, nowait = true, expr = true, desc = "Scroll float down" }
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts_scroll)
keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts_scroll)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts_scroll)
local opts_scroll_up = { silent = true, nowait = true, expr = true, desc = "Scroll float up" }
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts_scroll_up)
keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts_scroll_up)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts_scroll_up)

-- Selection ranges
keyset("n", "<leader>cs", "<Plug>(coc-range-select)", { silent = true, desc = "Select range" })
keyset("x", "<leader>cs", "<Plug>(coc-range-select)", { silent = true, desc = "Select range" })

-- User commands
vim.api.nvim_create_user_command("Format", "call CocAction('format')", { desc = "Format buffer (CoC)" })
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?", desc = "Fold buffer" })
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", { desc = "Organize imports" })

-- Statusline support
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- CoC list mappings
keyset("n", "<leader>ce", ":<C-u>CocDiagnostics<cr>", { silent = true, nowait = true, desc = "Buffer diagnostics" })
keyset("n", "<leader>cE", ":<C-u>CocDiagnostics!<cr>", { silent = true, nowait = true, desc = "All diagnostics" })
keyset("n", "<leader>cx", ":<C-u>CocList extensions<cr>", { silent = true, nowait = true, desc = "Extensions" })
keyset("n", "<leader>cc", ":<C-u>CocList commands<cr>", { silent = true, nowait = true, desc = "Commands" })
keyset("n", "<leader>cn", ":<C-u>CocNext<cr>", { silent = true, nowait = true, desc = "Next item" })
keyset("n", "<leader>cp", ":<C-u>CocPrev<cr>", { silent = true, nowait = true, desc = "Previous item" })
keyset("n", "<leader>cr", ":<C-u>CocListResume<cr>", { silent = true, nowait = true, desc = "Resume list" })
