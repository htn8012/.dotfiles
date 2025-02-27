-- check  :h cterm-colors
return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		local function mode(x)
			return { bg = x, fg = Colors.dark_bg, gui = "NONE" }
		end

		local def = { bg = Colors.statusline, fg = vim.g.terminal_color_8 }
		local def_italic = vim.deepcopy(def)
		def_italic.gui = "italic"
		local custom_theme = {
			normal = {
				a = mode(vim.g.terminal_color_12), --6a green 10
				b = def,
				c = def,
				z = def_italic,
			},
			insert = {
				a = mode(vim.g.terminal_color_13), --d8 blue 12
				b = def,
				c = def,
				z = def_italic,
			},
			visual = {
				a = mode(vim.g.terminal_color_10), --6e yellow 11
				b = def,
				c = def,
				z = def_italic,
			},
			replace = {
				a = mode(vim.g.terminal_color_9), --43 red 9
				b = def,
				c = def,
				z = def_italic,
			},
			command = {
				a = mode(vim.g.terminal_color_15), --b8 violet 13
				b = def,
				c = def,
				z = def_italic,
			},
			terminal = {
				a = mode(vim.g.terminal_color_13), --7c greendark 15
				b = def,
				c = def,
				z = def_italic,
			},
			inactive = {
				a = def,
				b = def,
				c = def,
				z = def_italic,
			},
		}
		require("lualine").setup({
			options = {
				theme = custom_theme,
				component_separators = { left = "|", right = "" },
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
