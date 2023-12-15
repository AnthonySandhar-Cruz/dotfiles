return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		local config = require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = true,
		color_overrides = {
			all = {
				text = "#ffffff",
			},
			latte = {},
			frappe = {},
			macchiato = {},
			mocha = {
				base = "#131c26",
				mantle = "#ff84ac",
				crust = "#474747",
				},
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
