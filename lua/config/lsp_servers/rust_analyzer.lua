return {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = false,
				loadOutDirsFromCheck = true,
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
			-- Disable lens features for performance
			lens = {
				enable = false,
			},
			-- Disable inlay hints for performance
			inlayHints = {
				chainingHints = { enable = false },
				parameterHints = { enable = false },
				typeHints = { enable = false },
			},
			-- Completion performance
			completion = {
				limit = 50,
				autoimport = { enable = true },
			},
		},
	},
}
