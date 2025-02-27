return {
	"folke/snacks.nvim",
	lazy = false,
	enabled = true,
	config = function()
		local snacks = require("snacks")
		snacks.setup({
			indent = {
				enabled = true,
			},
			bigfile = {
				enabled = true,
			},

			rename = {
				enabled = true,
			},

			scroll = {
				enabled = true,
			},

			statuscolumn = {
				enabled = true,
			},
		})
	end,
}
