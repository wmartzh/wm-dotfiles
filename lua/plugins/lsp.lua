return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
	},
	opts = {
		automatic_enable = true,
	},
	config = function()
		local capabilitiesOpts = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		}
		local capabilities = require("blink.cmp").get_lsp_capabilities(capabilitiesOpts)

		local on_attach = function(_, bufnr)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			-- 	buffer = bufnr,
			-- 	desc = "Go to definition",
			-- })
			-- vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {
			-- 	buffer = bufnr,
			-- 	desc = "Go to type definition",
			-- })
			-- vim.keymap.set("n", "gr", function()
			-- 	require("fzf-lua").lsp_references()
			-- end, {
			-- 	buffer = bufnr,
			-- 	desc = "Go to references (FZF)",
			-- })
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
			-- 	buffer = bufnr,
			-- 	desc = "Go to implementation",
			-- })
			-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
			-- 	buffer = bufnr,
			-- 	desc = "Rename symbol",
			-- })
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
			-- 	buffer = bufnr,
			-- 	desc = "See code actions",
			-- })
		end

		local default_config = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		local lua_ls = require("config.lsp_servers.lua_ls")
		local vtsls = require("config.lsp_servers.vtsls")
		local gopls = require("config.lsp_servers.gopls")
		-- local ts_ls = require("config.lsp_servers.ts_ls")
		-- config lua server

		vim.lsp.config("deno", {
			settings = {
				deno = {
					enable = true,
					lint = true,
				},
			},
			root_markers = { { "deno.json", "deno.jsonc" } },
		})

		vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", default_config, lua_ls))
		-- vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", default_config, ts_ls))
		vim.lsp.config("vtsls", vim.tbl_deep_extend("force", default_config, vtsls))
		vim.lsp.config("gopls", vim.tbl_deep_extend("force", default_config, gopls))
		vim.lsp.enable({
			"lua_ls",
			"gopls",
			"vtsls",
		})
	end,
}
