require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua", "luaformatter" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		go = { "gofumpt", "goimports_reviser", "golines" },
		java = { "clang_format" },
	},
   format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
