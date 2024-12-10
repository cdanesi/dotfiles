return {
   'nvim-treesitter/nvim-treesitter-textobjects',
   dependencies = {
      'nvim-treesitter/nvim-treesitter',
   },
   event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },

   opts = {
      textobjects = {
         select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
               -- You can use the capture groups defined in textobjects.scm
               ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
               ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
               ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
               ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

               ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
               ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

               ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
               ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

               ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
               ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

               ['aC'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
               ['iC'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

               ['af'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
               ['if'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

               ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
               ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },

               ['as'] = { query = '@scope', query_group = 'locals', desc = 'Language Scope' },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
               ['@parameter.outer'] = 'v',
               ['@function.outer'] = 'v',
               ['@class.outer'] = 'V',
               ['@scope'] = '<c-v>',
            },
            include_surrounding_whitespace = false,
         },
         swap = {
            enable = true,
            swap_next = {
               ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
               ['<leader>n:'] = '@property.outer', -- swap object property with next
               ['<leader>nm'] = '@function.outer', -- swap function with next
            },
            swap_previous = {
               ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
               ['<leader>p:'] = '@property.outer', -- swap object property with prev
               ['<leader>pm'] = '@function.outer', -- swap function with previous
            },
         },
         move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
               [']f'] = { query = '@call.outer', desc = 'Next function call start' },
               [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
               [']c'] = { query = '@class.outer', desc = 'Next class start' },
               [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
               [']l'] = { query = '@loop.*', desc = 'Next loop start' },

               -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
               -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
               [']S'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
               [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
            },
            goto_next_end = {
               [']F'] = { query = '@call.outer', desc = 'Next function call end' },
               [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
               [']C'] = { query = '@class.outer', desc = 'Next class end' },
               [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
               [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
            },
            goto_previous_start = {
               ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
               ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
               ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
               ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
               ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
            },
            goto_previous_end = {
               ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
               ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
               ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
               ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
               ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
            },
            goto_next = {
               [']-'] = { query = '@comment.outer', desc = 'Next comment' },
            },
            goto_previous = {
               ['[-'] = { query = '@comment.outer', desc = 'Prev comment' },
            },
         },
         lsp_interop = {
            enable = true,
            border = 'rounded',
            peek_definition_code = {
               ['<leader>pd'] = '@function.outer',
               ['<leader>pD'] = '@class.outer',
            },
         },
      },
   },

   config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- make builtin f, F, t, T repeatable
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

      --  ─────────────────────────────────────────────────────── gitsigns ──
      local gs = require('gitsigns')
      local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(function()
         gs.nav_hunk('next')
      end, function()
         gs.nav_hunk('prev')
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, ']h', next_hunk_repeat)
      vim.keymap.set({ 'n', 'x', 'o' }, '[h', prev_hunk_repeat)

      --  ───────────────────────────────────────────────────── bufferline ──
      local bl = require('bufferline')
      local next_buffer, prev_buffer = ts_repeat_move.make_repeatable_move_pair(function()
         bl.cycle(1)
      end, function()
         bl.cycle(-1)
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, ']b', next_buffer)
      vim.keymap.set({ 'n', 'x', 'o' }, '[b', prev_buffer)
   end,
}