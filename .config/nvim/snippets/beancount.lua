local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('beancount', {
   s('tx', {
      t(os.date('%Y-%m-%d') .. ' * "'),
      i(1, 'Payee'),
      t('" "'),
      i(2, 'Description'),
      t({ '"', '   ' }),
      i(3, 'Expenses:Category'),
      t('         '),
      i(4, '00.00'),
      t({ ' USD', '   ' }),
      i(5, 'Assets:Bank:Account'),
      i(0),
   }),

   s('cloudflare', {
      t(os.date('%Y-%m-%d') .. ' * "Cloudflare" "'),
      i(1, 'Note'),
      t({ '"', '   Expenses:Business:Subscriptions' }),
      t('         '),
      i(2, '12.00'),
      t({ ' USD', '   ' }),
      i(3, 'Assets:Bank:Account'),
      i(0),
   }),

   s('ccpay', {
      t(os.date('%Y-%m-%d') .. ' * "'),
      i(1, 'Payee'),
      t({ '" "Credit Card Payment"', '   Expenses:Financial:CreditCardPayments' }),
      t('         '),
      i(2, '250.00'),
      t({ ' USD', '   ' }),
      i(3, 'Assets:Bank:Account'),
      i(0),
   }),
})
