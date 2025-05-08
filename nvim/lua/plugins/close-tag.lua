return {
	"alvan/vim-closetag",
	config = function()
		vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.tsx,*.vue"
		vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,*.tsx,*.vue"
		vim.g.closetag_filetypes = "html,xhtml,phtml,javascript,typescript,jsx,tsx,vue"
		vim.g.closetag_xhtml_filetypes = "xhtml,jsx,tsx,vue"
		vim.g.closetag_emptyTags_caseSensitive = 1
	end,
}
