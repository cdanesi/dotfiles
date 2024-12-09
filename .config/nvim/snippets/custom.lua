local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
   s('hdr', {
      t({
         '-- URL: https://github.com/cdanesi/dotfilesi/blob/main/' .. vim.fn.bufname('%'),
         '-- Created/Modified: ' .. os.date('%Y-%m-%d'),
      }),
   }),
})
