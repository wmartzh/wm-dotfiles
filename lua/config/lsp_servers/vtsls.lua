return {
	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
					entriesLimit = 50,
				},
				maxInlayHintLength = 0,
			},
		},
		typescript = {
			tsdk = "node_modules/typescript/lib",
			preferences = {
				importModuleSpecifier = "relative",
			},
			inlayHints = {
				parameterNames = { enabled = "none" },
				parameterTypes = { enabled = false },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = false },
				functionLikeReturnTypes = { enabled = false },
				enumMemberValues = { enabled = false },
			},
			suggest = {
				completeFunctionCalls = false,
			},
			tsserver = {
				maxTsServerMemory = 4096,
				watchOptions = {
					excludeDirectories = {
						"**/node_modules",
						"**/.git",
						"**/dist",
						"**/.angular",
						"**/coverage",
						"**/tmp",
					},
				},
			},
		},
		javascript = {
			inlayHints = {
				parameterNames = { enabled = "none" },
				parameterTypes = { enabled = false },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = false },
				functionLikeReturnTypes = { enabled = false },
				enumMemberValues = { enabled = false },
			},
			suggest = {
				completeFunctionCalls = false,
			},
		},
	},
}
