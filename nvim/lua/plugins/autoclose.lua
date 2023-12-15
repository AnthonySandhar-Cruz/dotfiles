return {
	"m4xshen/autoclose.nvim",
	config = function()
		local config = require("autoclose")
		config.setup({
		keys = {
			["$"] = { escape = true, close = true, pair = "$$", disabled_filetype = {} },
			},
		})
	end
}
