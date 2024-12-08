local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('lua', {
   s('map', {
      t('vim.keymap.set('),
      i(1, 'mode'),
      t(", '"),
      i(2, 'lhs'),
      t("', '"),
      i(3, 'rhs'),
      t("', "),
      i(4, 'opts'),
      t(')'),
      i(0),
   }),
})
