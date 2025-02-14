return {
	"ibhagwan/fzf-lua",
	lazy = false,
	dependencies = { "echasnovski/mini.icons" },
	version = false,
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find Buffers" },
		{ "<leader>fs", "<cmd>FzfLua live_grep_native<cr>", desc = "Find Live grep" },
	},
	opts = function()
		local actions = require("fzf-lua.actions")
		local img_prev_bin = vim.fn.executable("ueberzug") == 1 and { "ueberzug" }
			or vim.fn.executable("chafa") == 1 and { "chafa" }
			or vim.fn.executable("viu") == 1 and { "viu", "-b" }
			or nil
		local fzflua = {
			"default-prompt",
			fzf_colors = {
				true,
				["fg"] = { "fg", "CursorLine" },
				["fg+"] = { "fg", "Normal" },
				["bg"] = { "bg", "Normal" },
				["bg+"] = { "bg", { "CursorLine", "Normal" } },
				["gutter"] = "-1",
			},
			keymap = {
				builtin = {
					["<c-d>"] = "preview-page-down",
					["<c-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-e"] = "select-all+accept",
				},
			},
			fzf_opts = {
				["--cycle"] = "",
			},
			previewers = {
				builtin = {
					ueberzug_scaler = "cover",
					extensions = {
						["gif"] = img_prev_bin,
						["png"] = img_prev_bin,
						["jpg"] = img_prev_bin,
						["jpeg"] = img_prev_bin,
						["svg"] = { "chafa" },
					},
				},
			},
			winopts = {
				-- split = 'botright new',
				border = "single",
				backdrop = 100,
				preview = {
					border = "single",
					layout = "flex",
					flip_columns = 120,
					scrollbar = "float",
				},
			},
			files = {
				cwd_prompt = false,
				prompt = "Files❯ ",
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			grep = {
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			lsp = {
				code_actions = {
					winopts = {
						preview = {
							layout = "vertical",
						},
					},
				},
			},
		}
		return fzflua
	end,
}
