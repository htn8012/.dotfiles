return {
	"aznhe21/hop.nvim",
	branch = "fix-some-bugs", -- optional but strongly recommended
	keys = {
		{ "<leader>w", ":HopWord<cr>", desc = "Hop Word" },
		{ "<leader>j", ":HopLineStartAC<cr>", desc = "Hop Line AC" },
		{ "<leader>k", ":HopLineStartBC<cr>", desc = "Hop Line BC" },
	},
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
