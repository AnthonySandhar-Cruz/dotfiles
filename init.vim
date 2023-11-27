:set number
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
set encoding=UTF-8
call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

imap jj <Esc>

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
EOF
