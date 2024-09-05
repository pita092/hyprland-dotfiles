local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set({ 'i' }, '<C-K>', function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-L>', function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

ls.add_snippets('cpp', {
  s('void_func', {
    t 'void ',
    i(1, 'name'),
    t '(',
    t ')',
    t '{',
    t '}',
  }),
})

ls.add_snippets('cpp', {
  s('int_func', {
    t 'int ',
    i(1, 'name'),
    t '(',
    i(2),
    t ')',
    t '{',
    t '}',
  }),
})

ls.add_snippets('cpp', {
  s('double_func', {
    t 'double ',
    i(1, 'name'),
    t '(',
    t ')',
    t '{',
    t '}',
  }),
})

ls.add_snippets('cpp', {
  s('float_func', {
    t 'float ',
    i(1, 'name'),
    t '(',
    t ')',
    t '{',
    t '}',
  }),
})

ls.add_snippets('lua', {
  s('plugin_table', {
    t 'return',
    t '{',
    i(1),
    t '}',
  }),
})

ls.add_snippets('lua', {
  s('Hello_r/unixporn', {
    t 'Hello r/unixporn',
    t 'Hello r/unixporn',
    t 'Hello r/unixporn',
    t 'Hello r/unixporn',
    t 'Hello r/unixporn',
    t 'Hello r/unixporn',
    t 'Hello r/unixporn',
  }),
})
