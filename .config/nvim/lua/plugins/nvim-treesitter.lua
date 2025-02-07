return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			highlight = { enable = true },
			match = { enable = true },
			indent = { enable = true },
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "previous function" },
						["[c"] = { query = "@class.outer", desc = "previous class" },
						["[p"] = { query = "@parameter.inner", desc = "previous parameter" },
					},
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "next function" },
						["]c"] = { query = "@class.outer", desc = "next class" },
						["]p"] = { query = "@parameter.inner", desc = "next parameter" },
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer" },
						["if"] = { query = "@function.inner" },
						["ac"] = { query = "@class.outer" },
						["ic"] = { query = "@class.inner" },
						["ai"] = { query = "@conditional.outer" },
						["ii"] = { query = "@conditional.inner" },
						["al"] = { query = "@loop.outer" },
						["il"] = { query = "@loop.inner" },
						["ap"] = { query = "@parameter.outer" },
						["ip"] = { query = "@parameter.inner" },
					},
					include_surrounding_whitespace = false,
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>s"] = { query = "@parameter.inner", desc = "swap next parameter" },
					},
					swap_previous = {
						["<leader>S"] = { query = "@parameter.inner", desc = "swap previous parameter" },
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
