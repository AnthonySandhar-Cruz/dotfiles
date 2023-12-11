vim.cmd("set relativenumber")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set mouse=a")
vim.cmd("imap jj <Esc>")
vim.g.mapleader = " "


-- Lazy.nvim config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugin initialization
local plugins = {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000
	},
	{ "neoclide/coc.nvim", branch = "release" },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "m4xshen/autoclose.nvim" },
	{ "SirVer/ultisnips" }
}

local opts = {}
require("lazy").setup(plugins, opts)

-- Telescope config
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "javascript", "python"},
	highlight = { enable = true },
	indent = { enable = true },
})

-- Catppuccin config
require("catppuccin").setup {
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
}
vim.cmd.colorscheme "catppuccin"

-- Autoclose config
require("autoclose").setup({
	keys = {
		["$"] = { escape = true, close = true, pair = "$$", disabled_filetype = {} },
	},
})

-- Ultisnips config
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
vim.g.UltiSnipsSnippetDirectories = {"tony_snips", "UltiSnips"}
