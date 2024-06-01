return {
    {
        'ellisonleao/gruvbox.nvim',
        config = function ()
			local gv = require 'gruvbox'
			gv.setup {
			contrast = "hard",
			palette_overrides = {
				dark0_hard = "#262626",
			},
			}
        vim.cmd.colorscheme 'gruvbox'
        end
    }
}
