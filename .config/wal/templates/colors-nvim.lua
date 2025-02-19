local palette = {{
	base00 = "{color0}",
	base01 = "{color0}",
	base02 = "{color8}",
	base03 = "{color1}",
	base04 = "{color6}",
	base05 = "{color14}",
	base06 = "{color7}",
	base07 = "{color15}",
	base08 = "{color2}",
	base09 = "{color3}",
	base0A = "{color4}",
	base0B = "{color5}",
	base0C = "{color13}",
	base0D = "{color12}",
	base0E = "{color11}",
	base0F = "{color10}"
}}

vim.g.colors_name = "base16-wal"
require("base16-colorscheme").setup(palette)
