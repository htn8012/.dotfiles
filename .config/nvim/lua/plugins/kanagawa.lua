return {
	"rebelot/kanagawa.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	opts = {
		compile = false,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = false },
		typeStyle = {},
		transparent = true,
		dimInactive = false,
		terminalColors = true,
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		overrides = function(colors) -- add/modify highlights
			local theme = colors.theme
			local makeDiagnosticColor = function(color)
				local c = require("kanagawa.lib.color")
				return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
			end

			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },

				AvanteTitle = { fg = theme.syn.string, bg = "none" },
				AvanteSubtitle = { fg = theme.syn.type, bg = "none" },
				AvanteThirdTitle = { fg = theme.syn.type, bg = "none" },

				FzfLuaBorder = { fg = theme.ui.float.fg_border },
				WinSeparator = { fg = theme.ui.float.fg_border },
				NeoTreeRootName = { fg = theme.syn.comment },

				LazyNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
				MasonNormal = { fg = theme.ui.fg_dim, bg = "none" },

				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },

				DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
				DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
				DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
				DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
			}
		end,
		theme = "wave",
		background = {
			dark = "wave", -- "dragon" | "wave"
			light = "lotus",
		},
	},
	init = function()
		vim.cmd("colorscheme kanagawa")
	end,
}
