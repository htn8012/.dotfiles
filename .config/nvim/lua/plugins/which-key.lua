return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			border = "single",
			title = false,
			wo = {
				winblend = 100, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},
	},
}
