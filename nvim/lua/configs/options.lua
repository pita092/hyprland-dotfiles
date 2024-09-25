local opt = vim.opt
local o = vim.o
local g = vim.g

opt.hlsearch = false
opt.incsearch = true

vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
g.have_nerd_font = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.g.cursorword_enabled = false  -- for vim-cursorword
-- or
vim.g.vim_current_word_disabled_in_buffers = 1  -- for vim-current-word

g.vimtex_view_method = "mupdf"
o.expandtab = true
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 50
opt.colorcolumn = "80"
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
--opt.listchars = {tab = "» " , trail = "·", nbsp = "␣" }
o.termguicolors = true
vim.o.showtabline = 2
o.updatetime = 50
opt.inccommand = "split"
o.cursorline = false
o.cursorlineopt = "number"
opt.scrolloff = 10

opt.whichwrap:append("<>[]hl")

local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

if g.neovide then
	g.neovide_padding_top = 0
	g.neovide_padding_bottom = 0
	g.neovide_padding_right = 0
	g.neovide_padding_left = 0
	g.neovide_confirm_quit = true
end
