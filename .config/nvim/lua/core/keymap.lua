--  ────────────────────────────────────────────────────( leader key )─
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local keymap = vim.keymap

local function opts(desc)
   return { desc = desc, silent = true }
end

--  ───────────────────────────────────────────────────( general use )─
keymap.set('i', 'jk', '<ESC>', opts('Exit insert mode with jk'))
keymap.set('n', '<leader>nh', ':nohl<CR>', opts('Clear search highlights'))
keymap.set({ 'n', 'v' }, '<leader>cm', '<cmd>Noice dismiss<CR>', opts('Dismiss notifications'))
keymap.set('n', '<leader>?', '<cmd>Telescope help_tags<CR>', opts('Search documentation'))

--  ──────────────────────────────────────────────────────( run code )─
keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', opts('Execute the current file'))
keymap.set('n', '<leader>cx', ':.lua<CR>', opts('Execute current line'))
keymap.set('v', '<leader>cx', ':lua<CR>', opts('Execute selected code'))

--  ────────────────────────────────────────────────────( formatting )─
keymap.set({ 'n', 'v' }, '<leader>F', function()
   require('conform').format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
   })
end, opts('Format file or selection'))

--  ───────────────────────────────────────────────────────( linting )─
keymap.set('n', '<leader>l', function()
   require('lint').try_lint()
end, opts('Trigger linting for current file'))

--  ───────────────────────────────────────────────( inc/dec numbers )─
keymap.set('n', '<leader>+', '<C-a>', opts('Increment number'))
keymap.set('n', '<leader>-', '<C-x>', opts('Decrement number'))

--  ──────────────────────────────────────────────( split management )─
keymap.set('n', '<leader>sv', '<C-w>v', opts('Split window vertically'))
keymap.set('n', '<leader>sh', '<C-w>s', opts('Split window horizontally'))
keymap.set('n', '<leader>se', '<C-w>=', opts('Make splits equal size'))
keymap.set('n', '<leader>sx', '<cmd>close<CR>', opts('Close current split'))
keymap.set('n', '<leader>sm', '<cmd>MaximizerToggle<CR>', opts('Maximize/Minimize a split'))

--  ────────────────────────────────────────────────( tab management )─
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', opts('Open new tab'))
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', opts('Close current tab'))
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts("Go to next tab"))
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts("Go to previous tab"))
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', opts('Open current buffer in new tab'))

--  ────────────────────────────────────────────────────( bufferline )─
keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', opts('Toggle pinned tab'))
keymap.set('n', '<leader>bg', '<cmd>BufferLinePick<CR>', opts('Pick tab'))
keymap.set('n', '<leader>bx', '<cmd>bdelete<CR>', opts('Close tab'))
keymap.set('n', '<leader>bX', '<cmd>BufferLineCloseOthers<CR>', opts('Close other tabs'))
keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', opts('Next tab'))
keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', opts('Previous tab'))
keymap.set('n', '<S-L>', '<cmd>BufferLineMoveNext<CR>', opts('Move tab to the right'))
keymap.set('n', '<S-H>', '<cmd>BufferLineMovePrev<CR>', opts('Move tab to the left'))

--  ────────────────────────────────────────────( session management )─
keymap.set('n', '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', opts('Toggle session autosave'))
keymap.set('n', '<leader>wD', '<cmd>Autosession delete<CR>', opts('Delete a session'))
keymap.set('n', '<leader>wd', '<cmd>SessionDelete<CR>', opts('Delete session for cwd'))
keymap.set('n', '<leader>wl', '<cmd>SessionSearch<CR>', opts('Open session picker'))
keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', opts('Restore session for cwd'))
keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', opts('Save session for cwd'))

--  ─────────────────────────────────────────────────( todo comments )─
keymap.set('n', ']t', function()
   require('todo-comments').jump_next()
end, opts('Next todo comment'))

keymap.set('n', '[t', function()
   require('todo-comments').jump_prev()
end, opts('Previous todo comment'))

--  ───────────────────────────────────────────────────────( trouble )─
keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', opts('Open trouble workspace diagnostics'))
keymap.set(
   'n',
   '<leader>xd',
   '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
   opts('Open trouble document diagnostics')
)
keymap.set(
   'n',
   '<leader>xl',
   '<cmd>Trouble lsp toggle focus=false win.position=right<CR>',
   opts('Open trouble lsp reference')
)
keymap.set(
   'n',
   '<leader>xs',
   '<cmd>Trouble symbols toggle focus=false win.position=right<CR>',
   opts('Open trouble symbols list')
)
keymap.set('n', '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', opts('Open trouble quickfix list'))
keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', opts('Open trouble location list'))
keymap.set(
   'n',
   '<leader>xt',
   '<cmd>Trouble todo toggle win.position=right focus=false<CR>',
   opts('Open todos in trouble')
)

--  ─────────────────────────────────────────────────────( telescope )─
keymap.set(
   'n',
   '<leader>ff',
   '<cmd>Telescope find_files initial_mode=insert sort_mru=true sort_lastused=true select_current=true<cr>',
   opts('Fuzzy find files in cwd')
)
keymap.set(
   'n',
   '<leader>fr',
   '<cmd>Telescope oldfiles initial_mode=insert sort_mru=true sort_lastused=true select_current=true<cr>',
   opts('Fuzzy find recent files')
)
keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts('Find string in this buffer'))
keymap.set('n', '<leader>fS', '<cmd>Telescope live_grep<cr>', opts('Find string in cwd'))
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', opts('Find string under cursor in cwd'))
keymap.set(
   'n',
   '<leader>ft',
   '<cmd>TodoTelescope initial_mode=normal sort_mru=true sort_lastused=true select_current=true<cr>',
   opts('Find todos')
)
keymap.set(
   'n',
   '<leader>bb',
   '<cmd>Telescope buffers initial_mode=normal sort_mru=true sort_lastused=true select_current=true<cr>',
   opts('Select from open buffers')
)

--  ────────────────────────────────────────────────────( substitute )─
keymap.set('n', 's', function()
   require('substitute').operator()
end, opts('Substitute with motion'))
keymap.set('n', 'ss', function()
   require('substitute').line()
end, opts('Substitute line'))
keymap.set('n', 'S', function()
   require('substitute').eol()
end, opts('Substitute to end of line'))
keymap.set('x', 's', function()
   require('substitute').visual()
end, opts('Substitute in visual mode'))

--  ─────────────────────────────────────────────────────( nvim-tree )─
keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', opts('Toggle file explorer'))
keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', opts('Toggle file explorer on current file'))
keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', opts('Collapse file explorer'))
keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', opts('Refresh file explorer'))
keymap.set('n', '<leader>eo', '<cmd>Oil --float<CR>', opts('Browse with Oil'))

--  ──────────────────────────────────────────────────────────( diff )─
keymap.set('n', '<leader>hd', function()
   require('gitsigns').diffthis()
   vim.cmd('windo set wrap')
end, opts('Diff this'))
keymap.set('n', '<leader>hD', function()
   require('gitsigns').diffthis('~')
end, opts('Diff this ~'))

--  ───────────────────────────────────────────────────────────( git )─
keymap.set('n', '<leader>Lg', '<cmd>LazyGit<cr>', opts('Open LazyGit'))
keymap.set('n', ']h', function()
   require('gitsigns').nav_hunk('next')
end, opts('Next hunk'))
keymap.set('n', '[h', function()
   require('gitsigns').nav_hunk('prev')
end, opts('Prev hunk'))
keymap.set('n', '<leader>hs', function()
   require('gitsigns').stage_hunk()
end, opts('Stage Hunk'))
keymap.set('n', '<leader>hr', function()
   require('gitsigns').reset_hunk()
end, opts('Reset Hunk'))
keymap.set('v', '<leader>hs', function()
   require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, opts('Stage Hunk'))
keymap.set('v', '<leader>hr', function()
   require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end, opts('Reset Hunk'))
keymap.set('n', '<leader>hS', function()
   require('gitsigns').stage_buffer()
end, opts('Stage buffer'))
keymap.set('n', '<leader>hR', function()
   require('gitsigns').reset_buffer()
end, opts('Reset buffer'))
keymap.set('n', '<leader>hu', function()
   require('gitsigns').undo_stage_hunk()
end, opts('Undo stage hunk'))
keymap.set('n', '<leader>hp', function()
   require('gitsigns').preview_hunk()
end, opts('Preview hunk'))
keymap.set('n', '<leader>hb', function()
   require('gitsigns').blame_line({ full = true })
end, opts('Blame line'))
keymap.set('n', '<leader>hB', function()
   require('gitsigns').toggle_current_line_blame()
end, opts('Toggle line blame'))
keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts('Gitsigns select hunk'))

--  ───────────────────────────────────────────────────( icon picker )─
keymap.set('n', '<Leader>i', '<cmd>Telescope symbols initial_mode=normal theme=get_ivy<cr>', opts('Open icon picker'))
keymap.set(
   'i',
   '<M-.>',
   '<cmd>Telescope symbols initial_mode=normal theme=get_ivy<cr>',
   opts('Icon picker (Insert Mode)')
)

--  ──────────────────────────────────────────────────( color picker )─
keymap.set('n', '<leader>cp', '<cmd>CccPick<CR>', opts('Open color picker'))
keymap.set({ 'n', 'v' }, '<leader>cv', '<cmd>CccConvert<CR>', opts('Convert color'))
keymap.set('n', '<leader>cc', '<cmd>CccHighlighterToggle<CR>', opts('Toggle rendered colors'))

--  ──────────────────────────────────────────────────────( markdown )─
keymap.set('n', '<leader>cr', '<cmd>MdEval<CR>', opts('Execute markdown codeblock'))

--  ────────────────────────────────────────────────────( spellcheck )─
keymap.set('n', '<leader>S', function()
   if vim.wo.spell then
      vim.opt_local.spell = false
   else
      vim.opt_local.spell = true
   end
end, opts('Toggle spell check'))
keymap.set('i', '<C-s>', function()
   if vim.wo.spell then
      vim.opt_local.spell = false
   else
      vim.opt_local.spell = true
   end
end, opts('Toggle spell check'))