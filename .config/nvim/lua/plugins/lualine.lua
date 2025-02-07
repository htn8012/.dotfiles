return {
	"nvim-lualine/lualine.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		local colors = require("kanagawa.colors").setup()
		local colors_theme = colors.theme
		local kanagawa_theme = {
			normal = {
				a = { fg = colors_theme.ui.bg_dim, bg = colors_theme.syn.statement },
				b = { fg = colors_theme.ui.fg_dim, bg = "none" },
				c = { fg = colors_theme.ui.fg_dim, bg = "none" },
				z = { fg = colors_theme.ui.fg_dim, bg = "none" },
			},

			insert = {
				a = { fg = colors_theme.ui.bg, bg = colors_theme.syn.string },
				z = { fg = colors_theme.ui.fg_dim, bg = "none" },
			},
			visual = {
				a = { fg = colors_theme.ui.bg, bg = colors_theme.syn.constant },
				z = { fg = colors_theme.ui.fg_dim, bg = "none" },
			},
			replace = {
				a = { fg = colors_theme.ui.bg, bg = colors_theme.syn.special2 },
				z = { fg = colors_theme.ui.fg_dim, bg = "none" },
			},

			inactive = {
				a = { fg = colors_theme.ui.fg_dim, bg = "none" },
				b = { fg = colors_theme.ui.fg_dim, bg = "none" },
				c = { fg = colors_theme.ui.fg_dim, bg = "none" },
			},
		}
		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				theme = kanagawa_theme,
			},
		})
	end,
}
