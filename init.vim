:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()
Plug 'https://github.com/preservim/nerdtree'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.4'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'm4xshen/autoclose.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
set encoding=UTF-8
call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

imap jj <Esc>

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsSnippetsDir=$HOME.'\AppData\Local\nvim\tony_snips'
let g:UltiSnipsSnippetDirectories=["tony_snips", "UltiSnips"]

lua << EOF
require("catppuccin").setup {
	flavour = "mocha",
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

require("autoclose").setup({
	keys = {
		["$"] = { escape = true, close = true, pair = "$$", disabled_filetype = {} },
	},
})

EOF
