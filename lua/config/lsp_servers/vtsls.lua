return {
	settings = {
		vtsls = {
			experimental = {
				completion = {
					-- This enables server-side fuzzy matching,
					-- which can be faster.
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		-- Ensure the workspace version of TypeScript is used
		typescript = {
			tsdk = "node_modules/typescript/lib",
		},
	},
}
