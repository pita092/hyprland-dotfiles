local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter", "ColorScheme" }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		if not normal.bg then
			return
		end
		io.write(string.format("\027]11;#%06x\027\\", normal.bg))
	end,
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.write("\027]111\027\\")
	end,
})

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("FilePost", { clear = true }),
	callback = function(args)
		local file = vim.api.nvim_buf_get_name(args.buf)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

		if not vim.g.ui_entered and args.event == "UIEnter" then
			vim.g.ui_entered = true
		end

		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
			vim.api.nvim_del_augroup_by_name("FilePost")

			vim.schedule(function()
				vim.api.nvim_exec_autocmds("FileType", {})

				if vim.g.editorconfig then
					require("editorconfig").config(args.buf)
				end
			end)
		end
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "neo-tree",
	callback = function()
		vim.opt_local.fillchars:append({ eob = " " })
	end,
})

vim.defer_fn(function()
	vim.cmd([[
    highlight SignColumn guibg=NONE ctermbg=NONE
  ]])
end, 100)
---custom commands

vim.api.nvim_create_user_command("Updt", "Lazy update nvim-plugins", {
	desc = "Update neovim plugins",
})

vim.api.nvim_create_user_command("LintInfo", function()
	local lint = require("lint")
	local filetype = vim.bo.filetype
	local linters = lint.linters_by_ft[filetype] or {}

	local info = "Linters for " .. filetype .. ":\n"
	if #linters > 0 then
		for _, linter in ipairs(linters) do
			info = info .. "- " .. linter .. "\n"
		end
	else
		info = info .. "No linters configured."
	end

	vim.api.nvim_echo({ { info, "Normal" } }, false, {})
end, {})

--just stright uo stole this from kickstart.nvim
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
