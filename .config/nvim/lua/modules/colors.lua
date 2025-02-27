vim.opt.bg = "dark"
vim.g.hs_highlight_debug = 1

Colors = {}

local function hl(group, options)
	vim.api.nvim_set_hl(0, group, options)
end

local function link(group_from, group_to, options)
	vim.api.nvim_set_hl(0, group_from, vim.tbl_extend("force", { link = group_to }, options or {}))
end

local function parse_rgb(s)
	local tail_s = s:sub(2)
	local res = {}
	for i in string.gmatch(tail_s, "%x%x") do
		table.insert(res, tonumber(i, 16))
	end
	return res
end

local function rgb_to_string(r, g, b)
	return string.format("#%02x%02x%02x", r, g, b)
end

local function checked_add(a, b)
	return math.max(0, math.min(0xff, a + b))
end

local function colormod(a, v1, v2, v3)
	return rgb_to_string(checked_add(a[1], v1), checked_add(a[2], v2), checked_add(a[3], v3))
end

local function apply_colors()
	local black = parse_rgb(vim.g.terminal_color_0)
	-- local def_comment = parse_rgb(vim.g.terminal_color_8)
	local dark_bg
	if Colors.dark_bg == nil then
		dark_bg = colormod(black, -6, -6, -6)
		Colors.dark_bg = dark_bg
	else
		dark_bg = Colors.dark_bg
	end
	local light_bg = colormod(black, 35, 35, 35)

	-- normal stuff
	hl("EndOfBuffer", { fg = vim.g.terminal_color_0 })
	hl("SignColumn", { bg = nil })
	hl("ColorColumn", { bg = nil, fg = vim.g.terminal_color_8 })
	hl("IncSearch", { bg = vim.g.terminal_color_8, fg = vim.g.terminal_color_0, bold = false })
	hl("NonText", { fg = light_bg })
	hl("StatusLine", { bg = nil })
	hl("WinSeparator", { fg = light_bg, bg = nil })

	-- Pmenu
	hl("Pmenu", { fg = light_bg })
	hl("PmenuThumb", { bg = light_bg })
	hl("PmenuSel", { bg = vim.g.terminal_color_8, fg = vim.g.terminal_color_0, bold = false })
	link("QuickFixLine", "PmenuSel")

	hl("NormalFloat", { bg = nil })
	hl("FloatBorder", { bg = nil })
	hl("FloatTitle", { bg = nil })

	-- custom
	hl("DarkNormal", { bg = dark_bg })

	-- diagnostics
	hl("DiagnosticError", { bg = nil, fg = vim.g.terminal_color_9 })
	hl("DiagnosticInfo", { bg = nil, fg = vim.g.terminal_color_13 })
	hl("DiagnosticWarn", { bg = nil, fg = vim.g.terminal_color_11 })
	hl("DiagnosticHint", { bg = nil, fg = vim.g.terminal_color_12 })
	hl("DiagnosticUnderlineError", { bg = nil, fg = nil, undercurl = true })
	hl("DiagnosticUnderlineWarn", { bg = nil, fg = nil, underline = true })

	link("FidgetTitle", "Pmenu", { blend = 10 })
	link("FidgetTask", "Pmenu", { blend = 10 })
	link("WhichKeyFloat", "Pmenu")
	link("LineNr", "Comment")
	link("Visual", "PmenuSel")
	link("FzfLuaBorder", "WinSeparator")
	link("NeoTreeFloatBorder", "WinSeparator")
	link("Visual", "PmenuSel")
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		apply_colors()
	end,
})

return {
	parse_rgb = parse_rgb,
	rgb_to_string = rgb_to_string,
}
