return {
	{
		"echasnovski/mini.starter",
		enabled = true,
		version = false,
		opts = function()
			local starter = require("mini.starter")
			return {
				items = {
					starter.sections.recent_files(5, true),
				},
				silent = true,
			}
		end,
	},
	{
		"echasnovski/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
