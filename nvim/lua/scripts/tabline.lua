local M = {}
local function get_file_icon(filename)
  local file_icon = {
    ['lua'] = '󰢱 ',
    ['py'] = ' ',
    ['js'] = ' ',
    ['ts'] = ' ',
    ['json'] = ' ',
    ['cpp'] = ' ',
    ['yml'] = '',
    ['yaml'] = '',
    ['toml'] = ' ',
    ['md'] = ' ',
    ['txt'] = ' ',
    ['vim'] = ' ',
    ['sh'] = ' ',
    ['bash'] = ' ',
    ['zsh'] = ' ',
    ['fish'] = '  ',
    ['conf'] = ' ',
    ['ini'] = '',
    ['gitignore'] = ' ',
    ['gitconfig'] = ' ',
  }
  local extension = filename:match '^.+%.(.+)$'
  return file_icon[extension] or ''
end

function M.MyTabLine()
  local s = ''
  for i = 1, vim.fn.tabpagenr '$' do
    -- Add a separator before each tab (except the first one)
    if i > 1 then
      s = s .. '|%#TabLineFill#|'
    end

    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    s = s .. '%' .. i .. 'T'
    s = s .. ' %{v:lua.require("scripts.tabline").MyTabLabel(' .. i .. ')} '
  end
  s = s .. '%#TabLineFill#%T'
  return s
end

function M.MyTabLabel(n)
  local buflist = vim.fn.tabpagebuflist(n)
  local winnr = vim.fn.tabpagewinnr(n)
  local bufnr = buflist[winnr]
  local filename = vim.fn.bufname(bufnr)
  local icon = get_file_icon(filename)
  local short_name = vim.fn.fnamemodify(filename, ':t')
  short_name = short_name ~= '' and short_name or '[No Name]'
  return icon .. ' ' .. short_name
end

function M.setup()
  vim.o.tabline = [[%!v:lua.require'scripts.tabline'.MyTabLine()]]
end

return M
