return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'VonHeikemen/lsp-zero.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  { 'j-hui/fidget.nvim', opts = {} },
  { 'j-hui/fidget.nvim', opts = {} },
}
