
function ColorMyPencils(color)
	color = color or "gruvbox"

	vim.cmd.colorscheme(color)

  vim.o.background = "dark"
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
