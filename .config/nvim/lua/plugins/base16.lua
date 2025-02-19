return {
	"RRethy/nvim-base16",
	event = "VimEnter",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	priority = 1000,
	config = function()
		require("modules.colors")
		vim.cmd.colors("base16-wal")
	end,
}
