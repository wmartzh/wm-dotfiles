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

		local on_attach = function(_, bufnr) end

		local default_config = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		local lua_ls = require("config.lsp_servers.lua_ls")
		local vtsls = require("config.lsp_servers.vtsls")
		local gopls = require("config.lsp_servers.gopls")
		local deno = require("config.lsp_servers.denols")
		local clangd = require("config.lsp_servers.clangd")
		-- local ts_ls = require("config.lsp_servers.ts_ls")
		-- config lua server

		vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", default_config, lua_ls))
		vim.lsp.config("clangd", vim.tbl_deep_extend("force", default_config, clangd))
		vim.lsp.config(
			"rust_analyzer",
			vim.tbl_deep_extend("force", default_config, {
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = false,
							buildScripts = {
								enable = false,
							},
						},
						check = {
							command = "check",
						},
						checkOnSave = true,
						procMacro = {
							enable = true,
							attributes = {
								enable = false,
							},
						},
						files = {
							excludeDirs = { ".git", "target", "node_modules" },
						},
						diagnostics = {
							enable = true,
							experimental = {
								enable = false,
							},
						},
					},
				},
			})
		)
		-- vim.lsp.config("lua_ls", vim.tbl_deep_extend("force", default_config, ts_ls))
		vim.lsp.config("vtsls", vim.tbl_deep_extend("force", default_config, vtsls))
		vim.lsp.config("gopls", vim.tbl_deep_extend("force", default_config, gopls))
		vim.lsp.config("denols", vim.tbl_deep_extend("force", default_config, deno))
		vim.lsp.enable({
			"lua_ls",
			"clangd",
			"gopls",
			"vtsls",
			"rust_analyzer",
			"denols",
		})
	end,
}
