require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = { "gcc" }
local parser_install_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser"
vim.opt.runtimepath:append(parser_install_dir)
require("nvim-treesitter.configs").setup({
	parser_install_dir = parser_install_dir,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
