return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	enabled = false,
	cond = function()
		-- Check for deno.json or deno.jsonc in the project root
		local deno_config = vim.fs.find({ "deno.json", "deno.jsonc" }, {
			upward = true,
			stop = vim.fn.expand("~"),
		})
		-- Disable if a Deno config is found
		return not next(deno_config)
	end,
	opts = {
		on_attach = function(client, bufnr)
			-- Use a local function to simplify keymap creation
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = "LSP: " .. desc })
			end

			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			-- Standard LSP keymaps
			-- See :help vim.lsp.buf
			map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
			map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
			map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")

			-- typescript-tools.nvim specific keymaps
			-- See :help typescript-tools-commands
			map("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", "Organize Imports")
			map("n", "<leader>fi", ":TSToolsFixAll<CR>", "Fix All Diagnostics")
			map("n", "<leader>ri", ":TSToolsRemoveUnusedImports<CR>", "Remove Unused Imports")
		end,
		settings = {
			go_to_source_definition = {
				fallback = true, -- fall back to standard LSP definition on failure
			},
			tsserver_max_memory = 4096,
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "none",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = false,
					includeInlayVariableTypeHints = false,
					includeInlayPropertyDeclarationTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = false,
					includeInlayEnumMemberValueHints = false,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "none",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = false,
					includeInlayVariableTypeHints = false,
					includeInlayPropertyDeclarationTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = false,
					includeInlayEnumMemberValueHints = false,
				},
			},
			separate_diagnostic_server = true,
			completion_experimental = {
				enableServerSideFuzzyMatch = true,
			},
			codelens = {
				enabled = false,
			},
		},
	},
}
