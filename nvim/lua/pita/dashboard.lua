local api = vim.api
local buffer = nil
local window = nil

local M = {}

local original_guicursor

--highlighitng and shit
local function set_highlight_groups()
  vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#fabd2f', bold = true })
  vim.api.nvim_set_hl(0, 'DashboardOption', { fg = '#fbf1c7' })
  vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#fe8019', bold = true })
  vim.api.nvim_set_hl(0, 'DashboardBackground', { bg = '#3c3836' }) --
end

--cursor functions :)
local function HideMouse()
  original_guicursor = vim.o.guicursor
  vim.opt.guicursor = 'a:block-Cursor/lCursor-blinkon0'
  vim.cmd 'hi Cursor blend=100'
end

local function RestoreMouse()
  if original_guicursor then
    vim.opt.guicursor = original_guicursor
    original_guicursor = nil
  else
    vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'
  end
  vim.cmd 'hi Cursor blend=0'
end

--close the dashord "and clean up" (a bit of help from ai)
local function CleanupAfterClosing()
  if window and api.nvim_win_is_valid(window) then
    api.nvim_win_close(window, true)
  end
  if buffer and api.nvim_buf_is_valid(buffer) then
    api.nvim_buf_delete(buffer, { force = true })
  end
  window = nil
  buffer = nil
  vim.api.nvim_del_augroup_by_name 'DashboardAutoClose'

  --again some cursor stuff the name is self explainetory
  RestoreMouse()
end

--auto close the menu when "something is happned" like mouse click buffer enter and stuff,
--uses the above function named 'close_dashboard_and_clean_up'

local function AutoClose()
  vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'CmdlineEnter', 'CmdwinEnter' }, {
    group = vim.api.nvim_create_augroup('DashboardAutoClose', { clear = true }),
    callback = CleanupAfterClosing,
  })
end

vim.api.nvim_create_autocmd({
  'WinEnter',
  'FileType',
  'BufWinEnter',
  'CmdlineEnter',
  'CmdwinEnter',
  'FocusGained',
  'VimResized',
  'TabEnter',
  'TermOpen',
}, {
  group = vim.api.nvim_create_augroup('DashboardAutoClose', { clear = true }),
  callback = function(ev)
    if ev.buf ~= buffer then
      CleanupAfterClosing()
    end
  end,
})

--yeah ^^^
--     ^^^
local function MouseClickBehavior()
  if buffer and api.nvim_get_current_buf() ~= buffer then
    CleanupAfterClosing()
  end
end

vim.on_key(function(key)
  if key == vim.api.nvim_replace_termcodes('<LeftMouse>', true, false, true) then
    vim.schedule(MouseClickBehavior)
  end
end)

--the name
local function CloseDashboard()
  if window and api.nvim_win_is_valid(window) then
    api.nvim_win_close(window, true)
  end
  if buffer and api.nvim_buf_is_valid(buffer) then
    api.nvim_buf_delete(buffer, { force = true })
  end
  window = nil
  buffer = nil
  RestoreMouse()
end

--the nameX2
local function CreateDashboard()
  buffer = api.nvim_create_buf(false, true)

  local content = {
    'Context Menu',
    '                        ┌────┐',
    '[e] New file ───────────│   │',
    '[f] Find file ──────────│ 󰮗  │',
    '[r] Recent files ───────│   │',
    '[s] Settings ───────────│   │',
    '[g] netRW	──────────────│   │',
    '                        └────┘',
    '',
  }

  api.nvim_buf_set_lines(buffer, 0, -1, false, content)

  local width = 0
  for _, line in ipairs(content) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end
  width = width + 4
  local height = #content + 2

  local editor_width = api.nvim_get_option 'columns'
  local editor_height = api.nvim_get_option 'lines'

  local row = math.floor((editor_height - height) / 2)
  local col = math.floor((editor_width - width) / 2)

  local ns_id = api.nvim_create_namespace 'dashboard'
  api.nvim_buf_add_highlight(buffer, ns_id, 'DashboardHeader', 0, 0, -1)
  for i = 2, #content - 1 do
    api.nvim_buf_add_highlight(buffer, ns_id, 'DashboardOption', i, 3, -1)
    api.nvim_buf_add_highlight(buffer, ns_id, 'DashboardShortcut', i, 0, 3)
  end

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'single',
  }

  HideMouse()

  vim.api.nvim_create_autocmd({ 'BufLeave', 'VimLeave' }, {
    buffer = buffer,
    callback = function()
      RestoreMouse()
    end,
    once = true,
  })

  window = api.nvim_open_win(buffer, true, opts)
  vim.api.nvim_win_set_option(window, 'winhl', 'Normal:DashboardBackground')

  api.nvim_buf_set_option(buffer, 'modifiable', false)
  api.nvim_buf_set_option(buffer, 'buftype', 'nofile')
  api.nvim_buf_set_option(buffer, 'filetype', 'dashboard')

  local function set_keymap(key, action)
    api.nvim_buf_set_keymap(buffer, 'n', key, action, { silent = true, noremap = true })
  end

  set_keymap('e', ':lua require("pita.dashboard").new_file()<CR>')
  set_keymap('f', ':lua require("pita.dashboard").telescope_findfiles()<CR>')
  set_keymap('r', ':lua require("pita.dashboard").telescope_oldfiles_in_new_tab()<CR>')
  set_keymap('s', ':Telescope find_files cwd=~/.config/nvim/<CR>')
  set_keymap('g', ':Ex<CR>')
end

--the nameX3
local function CenterDashboard()
  if window and vim.api.nvim_win_is_valid(window) then
    local editor_width = vim.api.nvim_get_option 'columns'
    local editor_height = vim.api.nvim_get_option 'lines'
    local win_width = vim.api.nvim_win_get_width(window)
    local win_height = vim.api.nvim_win_get_height(window)

    local row = math.floor((editor_height - win_height) / 2)
    local col = math.floor((editor_width - win_width) / 2)

    vim.api.nvim_win_set_config(window, {
      relative = 'editor',
      row = row,
      col = col,
    })
  end
end

--some function for the keybinds of the menu
function M.telescope_oldfiles_in_new_tab()
  CloseDashboard()
  require('telescope.builtin').oldfiles()
end

function M.telescope_findfiles()
  CloseDashboard()
  require('telescope.builtin').find_files()
end

function M.toggle_dashboard()
  set_highlight_groups()
  if window and api.nvim_win_is_valid(window) then
    CloseDashboard()
    return false
  else
    CreateDashboard()
    AutoClose()
    return true
  end
end

function M.new_file()
  CloseDashboard()
  vim.cmd 'enew'
end

--pretty useless but i am too lazy so i made a seperate function so that i can make the close_funtion "global"
function M.CloseDashboard()
  CloseDashboard()
end

--custom commands mainly for the keybinds
vim.api.nvim_create_user_command('Dashboard', function(opts)
  local width = tonumber(opts.args:match '^(%d+)')
  local height = tonumber(opts.args:match ' (%d+)$')
  M.toggle_dashboard(width, height)
end, { nargs = '*' })

vim.api.nvim_create_user_command('CloseDashboard', M.CloseDashboard, {})

vim.api.nvim_create_autocmd('VimResized', {
  callback = CenterDashboard,
})

return M
