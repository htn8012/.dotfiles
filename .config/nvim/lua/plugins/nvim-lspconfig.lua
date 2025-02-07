local M = {
	"neovim/nvim-lspconfig",
	enabled = true,
	lazy = false,
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- { "saghen/blink.cmp" },
		{ "hrsh7th/nvim-cmp" },
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{
			"j-hui/fidget.nvim",
			opts = {
				notification = {
					window = {
						winblend = 0, -- Background color opacity in the notification window
					},
				},
			},
		},
	},
}

function M.on_attach(_, bufnr)
	local map = function(key, func, desc)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		bufopts.desc = "Lsp " .. desc
		return vim.keymap.set("n", key, func, bufopts)
	end
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover" })
	map("J", vim.diagnostic.open_float, "show line diagnostics")
	map("<leader>ls", vim.lsp.buf.signature_help, "signature help")
	map("<leader>ld", vim.lsp.buf.definition, "go to definition")
	map("<leader>li", vim.lsp.buf.implementation, "go to implementation")
	map("<leader>lr", vim.lsp.buf.references, "go to references")
	map("<leader>fd", "<cmd>FzfLua lsp_definitions<cr>", "go to definition")
	map("<leader>fi", "<cmd>FzfLua lsp_implementations<cr>", "go to implementation")
	map("<leader>fr", "<cmd>FzfLua lsp_references<cr>", "go to references")
	map("[d", vim.diagnostic.goto_prev, "previous diagnostic")
	map("]d", vim.diagnostic.goto_next, "next diagnostic")
	map("<leader>la", vim.lsp.buf.code_action, "code action")
	map("<leader>rn", vim.lsp.buf.rename, "rename symbol")
	map("\\f", function()
		vim.lsp.buf.format({ async = true })
	end, "format document")
end

function M.config()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	-- local capabilities = require("blink.cmp").get_lsp_capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- Diagnostics symbols for display in the sign column.
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	mason_lspconfig.setup({
		ensure_installed = {
			"bashls",
			"lua_ls",
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"jsonls",
		},
	})
	mason_lspconfig.setup_handlers({
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			lspconfig[server_name].setup({
				on_attach = M.on_attach,
				capabilities = capabilities,
			})
		end,
		["jsonls"] = function()
			lspconfig.jsonls.setup({
				on_attach = M.on_attach,
				capabilities = capabilities,
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
						end,
					},
				},
			})
		end,
		["tailwindcss"] = function()
			lspconfig.tailwindcss.setup({
				on_attach = M.on_attach,
				capabilities = capabilities,
				settings = {
					tailwindCSS = {
						classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
						lint = {
							cssConflict = "warning",
							invalidApply = "error",
							invalidConfigPath = "error",
							invalidScreen = "error",
							invalidTailwindDirective = "error",
							invalidVariant = "error",
							recommendedVariantOrder = "warning",
						},
						validate = true,
						experimental = {
							classRegex = {
								{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
								{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							},
						},
					},
				},
			})
		end,
	})
end

return M
