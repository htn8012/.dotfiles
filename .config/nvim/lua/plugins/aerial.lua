return {
	"stevearc/aerial.nvim",
	keys = {
		{ "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial Toggle" },
	},
	opts = {
		layout = {
			default_direction = "prefer_right",
		},
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		-- "nvim-tree/nvim-web-devicons",
	},
}
