return {
	"aserowy/tmux.nvim",
	event = "VeryLazy",
	keys = {
		{ "<C-left>", [[<cmd>lua require("tmux").resize_left()<cr>]] },
		{ "<C-down>", [[<cmd>lua require("tmux").resize_bottom()<cr>]] },
		{ "<C-up>", [[<cmd>lua require("tmux").resize_top()<cr>]] },
		{ "<C-right>", [[<cmd>lua require("tmux").resize_right()<cr>]] },
	},
	opts = {
		resize = {
			enable_default_keybindings = false,
		},
	},
}
