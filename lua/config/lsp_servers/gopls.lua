return {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				staticcheck = true,
				gofumpt = true, -- If you want to use gofumpt for formatting
			},
			completeUnimported = true,
			usePlaceholders = true,
		},
	},
}
