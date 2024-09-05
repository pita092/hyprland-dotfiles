require('gruvbox').setup {
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = '', -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
}
vim.o.background = 'dark'
vim.cmd 'colorscheme gruvbox'
vim.cmd.colorscheolors = true
require('colorizer').setup {
  filetypes = {
    'html',
    'css',
    'javascript',
    'typescript',
    'typescriptreact',
    'javascriptreact',
    'lua',
  },
}

--neovide function

local function neovide_gruvbox()
  require('gruvbox').setup {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,
    contrast = '',
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = not vim.g.neovide,
  }
end

neovide_gruvbox()

if vim.g.neovide then
  vim.g.neovide_transparency = 1.0
  vim.g.transparency = 1.0
  neovide_gruvbox()
  vim.cmd 'colorscheme gruvbox'
  vim.g.neovide_background_color = '#32302F'
end
