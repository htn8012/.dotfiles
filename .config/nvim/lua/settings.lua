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
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 30000

vim.opt.laststatus = 3

vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = vim.api.nvim_create_augroup("Checktime", { clear = true }),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- highlight briefly on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_on_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "PmenuKindSel",
			timeout = 150,
			on_macro = true,
		})
	end,
})

-- automatic toggling
vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu		| set cul		| endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | set nocul		| endif
  augroup END
]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		-- Disable comment on new line
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = vim.api.nvim_create_augroup("General", { clear = true }),
	desc = "Disable New Line Comment",
})
