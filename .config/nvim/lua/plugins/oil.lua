return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "<leader>n", "<cmd>Oil<cr>", desc = "oil" },
	},
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<C-s>"] = false,
			["<C-h>"] = false,
			["<C-t>"] = false,
			["<C-l>"] = false,
			["-"] = false,
			["_"] = false,
			["`"] = false,
			["<leader>-"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.open_cwd", mode = "n" },
			["<C-c>"] = { "actions.close", mode = "n" },
			["q"] = { "actions.close", mode = "n" },
			["<leader>e"] = { "actions.close", mode = "n" },
			["<leader>n"] = { "actions.close", mode = "n" },
			["<C-r>"] = "actions.refresh",
			["<BS>"] = { "actions.parent", mode = "n" },
			["<CR>"] = "actions.select",
		},
	},
}
