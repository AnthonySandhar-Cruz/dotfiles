return {
	"SirVer/ultisnips",
	config = function()
		vim.g.UltiSnipsExpandTrigger = "<Tab>"
		vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
		vim.g.UltiSnipsSnippetDirectories = {"tony_snips", "UltiSnips"}
	end
}
