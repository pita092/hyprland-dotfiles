return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        '~/projects/my-awesome-lib',
        'lazy.nvim',
        'luvit-meta/library',
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        'LazyVim',

        { path = 'LazyVim', words = { 'LazyVim' } },

        { path = 'wezterm-types', mods = { 'wezterm' } },

        { path = 'xmake-luals-addon/library', files = { 'xmake.lua' } },
      },

      enabled = function(root_dir)
        return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
      end,

      enabled = function(root_dir)
        return not vim.uv.fs_stat(root_dir .. '/.luarc.json')
      end,
    },
  },
}
