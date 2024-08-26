vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.setleader = ' '
vim.cmd 'set number'
vim.cmd 'set tabstop=2'
vim.cmd 'set softtabstop=2'
vim.cmd 'set shiftwidth=2'
require 'pita.remaps'
require 'pita.lazy'
require 'pita.dashboard'
require('pita.tabline').setup()
require 'pita.commands'
vim.g.have_nerd_font = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.g.neovide_transparency = 1
vim.o.showtabline = 2

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
--vim.opt.listchars = {tab = "» " , trail = "·", nbsp = "␣" }
vim.opt.listchars = {
  eol = '↵',
  tab = '· ',
  trail = '▸',
  extends = '❯',
  precedes = '❮',
}
vim.opt.list = true
vim.o.showtabline = 2
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatNormal', { fg = '#ebdbb2', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#ebdbb2', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = '#ebdbb2', bg = 'NONE' })
