require('fidget').setup {
  progress = {
    poll_rate = 0,
    suppress_on_insert = false,
    ignore_done_already = false,
    ignore_empty_message = false,

    clear_on_detach = function(client_id)
      local client = vim.lsp.get_client_by_id(client_id)
      return client and client.name or nil
    end,
    notification_group = function(msg)
      return msg.lsp_client.name
    end,
    ignore = {},
    display = {
      render_limit = 16,
      done_ttl = 3,
      done_icon = '✔',
      done_style = 'Constant',
      progress_ttl = math.huge,
      progress_icon = { pattern = 'dots', period = 1 },
      -- Highlight group for in-progress LSP tasks
      progress_style = 'WarningMsg',
      group_style = 'Title', -- Highlight group for group name (LSP server name)
      icon_style = 'Question', -- Highlight group for group icons
      priority = 30, -- Ordering priority for LSP notification group
      skip_history = true, -- Whether progress notifications should be omitted from history
      -- How to format a progress message
      format_message = require('fidget.progress.display').default_format_message,
      -- How to format a progress annotation
      format_annote = function(msg)
        return msg.title
      end,
      -- How to format a progress notification group's name
      format_group_name = function(group)
        return tostring(group)
      end,
      overrides = { -- Override options from the default notification config
        rust_analyzer = { name = 'rust-analyzer' },
      },
    },

    lsp = {
      progress_ringbuf_size = 0,
      log_handler = false,
    },
  },

  notification = {
    poll_rate = 10,
    filter = vim.log.levels.INFO,
    history_size = 128,
    override_vim_notify = false,
    configs = { default = require('fidget.notification').default_config },
    redirect = function(msg, level, opts)
      if opts and opts.on_open then
        return require('fidget.integration.nvim-notify').delegate(msg, level, opts)
      end
    end,

    view = {
      stack_upwards = true,
      icon_separator = ' ',
      group_separator = '---',
      group_separator_hl = 'Comment',
      render_message = function(msg, cnt)
        return cnt == 1 and msg or string.format('(%dx) %s', cnt, msg)
      end,
    },

    window = {
      normal_hl = 'Comment',
      winblend = 0,
      border = 'none',
      zindex = 45,
      max_width = 0,
      max_height = 0,
      x_padding = 1,
      y_padding = 0,
      align = 'bottom',
      relative = 'editor',
    },
  },

  integration = {
    ['nvim-tree'] = {
      enable = true,
    },
    ['xcodebuild-nvim'] = {
      enable = true,
    },
  },

  logger = {
    level = vim.log.levels.WARN,
    max_size = 10000,
    float_precision = 0.01,
    path = string.format('%s/fidget.nvim.log', vim.fn.stdpath 'cache'),
  },
}
