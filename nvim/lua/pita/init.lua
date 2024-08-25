

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.setleader = " "
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
require("pita.remaps")
require("pita.lazy")
require("pita.commands")
vim.g.have_nerd_font = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.g.neovide_transparency = 1

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.listchars = {tab = "» " , trail = "·", nbsp = "␣" }
vim.opt.list = false
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
