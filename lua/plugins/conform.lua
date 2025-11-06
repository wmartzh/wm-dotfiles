return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		formatters_by_ft = {
			["html"] = { "prettierd" },
			["javascript"] = { "prettierd" },
			["javascriptreact"] = { "prettierd" },
			["markdown"] = { "prettierd" },
			["typescript"] = { "prettierd" },
			["typescriptreact"] = { "prettierd" },
			["go"] = { "goimports" },
			["*"] = { "trim_whitespace" },
			["lua"] = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
