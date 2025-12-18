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
			["c"] = { "clang_format" },
			["cpp"] = { "clang_format" },
			["*"] = { "trim_whitespace" },
			["lua"] = { "stylua" },
			["rust"] = { "rustfmt" },
		},
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
	},
}
