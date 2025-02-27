vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"
-- vim.opt.clipboard = ""

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.wrap = true

vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 30000

vim.opt.laststatus = 3
-- local statusline = {
-- 	"%f",
-- 	"%r",
-- 	"%m",
-- 	"%=",
-- 	"%{&filetype}",
-- 	"%2p%%",
-- 	"%3l:%-2c",
-- }
--
-- vim.o.statusline = table.concat(statusline, "")

vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12

-- highlight briefly on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_on_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "PmenuThumb",
			timeout = 150,
			on_macro = true,
		})
	end,
})
