--  ──────────────────────[ set leader key to space ]──────────────────────
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

--  ────────────────────────────[ general use ]────────────────────────────
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

--  ────────────────────────────[ formatting ]─────────────────────────
keymap.set({ "n", "v" }, "<leader>mp", function()
   require("conform").format {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
   }
end, { desc = "Format file or range (in visual mode)" })

--  ──────────────────────────────[ linting ]──────────────────────────────
vim.keymap.set("n", "<leader>l", function()
   require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

--  ──────────────────────────[ inc/dec numbers ]──────────────────────────
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

--  ─────────────────────────[ split management ]──────────────────────
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/Minimize a split" })

--  ──────────────────────────[ tab management ]───────────────────────
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

--  ────────────────────────────[ bufferline ]─────────────────────────
keymap.set("n", "<leader>pt", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pinned tab" })
keymap.set("n", "<leader>gb", "<cmd>BufferLinePick<CR>", { desc = "Pick tab" })
keymap.set("n", "<leader>gB", "<cmd>BufferLinePickClose<CR>", { desc = "Close tab" })
keymap.set("n", "[b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
keymap.set("n", "b]", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
-- keymap.set("n", "", "<cmd>BufferLineMoveNext<CR>", { desc = "Move tab to the right" })
-- keymap.set("n", "", "<cmd>BufferLineMovePrev<CR>", { desc = "Move tab to the left" })

--  ────────────────────────[ session management ]─────────────────────
keymap.set("n", "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", { desc = "Toggle session autosave" })
keymap.set("n", "<leader>wD", "<cmd>Autosession delete<CR>", { desc = "Delete a session" })
keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", { desc = "Delete session for cwd" })
keymap.set("n", "<leader>wl", "<cmd>SessionSearch<CR>", { desc = "Open session picker" })
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for cwd" })

--  ───────────────────────────────[ diff ]────────────────────────────
keymap.set("n", "<leader>hd", function()
   require("gitsigns").diffthis()
end, { desc = "Diff this" })
keymap.set("n", "<leader>hD", function()
   require("gitsigns").diffthis "~"
end, { desc = "Diff this ~" })

--  ───────────────────────────[ todo comments ]───────────────────────────
keymap.set("n", "]t", function()
   require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

keymap.set("n", "[t", function()
   require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

--  ──────────────────────────────[ trouble ]──────────────────────────────
keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" })
keymap.set(
   "n",
   "<leader>xd",
   "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
   { desc = "Open trouble document diagnostics" }
)
keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })

--  ─────────────────────────────[ telescope ]─────────────────────────────
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

--  ────────────────────────────[ substitute ]─────────────────────────
keymap.set("n", "s", function()
   require("substitute").operator()
end, { desc = "Substitute with motion" })
keymap.set("n", "ss", function()
   require("substitute").line()
end, { desc = "Substitute line" })
keymap.set("n", "S", function()
   require("substitute").line()
end, { desc = "Substitute to end of line" })
keymap.set("x", "s", function()
   require("substitute").visual()
end, { desc = "Substitute in visual mode" })

--  ─────────────────────────────[ nvim-tree ]─────────────────────────────
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

--  ────────────────────────────────[ git ]────────────────────────────────
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
keymap.set("n", "]h", function()
   require("gitsigns").next_hunk()
end, { desc = "Next hunk" })
keymap.set("n", "[h", function()
   require("gitsigns").prev_hunk()
end, { desc = "Prev hunk" })
keymap.set("n", "<leader>hs", function()
   require("gitsigns").stage_hunk()
end, { desc = "Stage Hunk" })
keymap.set("n", "<leader>hr", function()
   require("gitsigns").reset_hunk()
end, { desc = "Reset Hunk" })
keymap.set("v", "<leader>hs", function()
   require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Stage Hunk" })
keymap.set("v", "<leader>hr", function()
   require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Reset Hunk" })
keymap.set("n", "<leader>hS", function()
   require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
keymap.set("n", "<leader>hR", function()
   require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
keymap.set("n", "<leader>hu", function()
   require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
keymap.set("n", "<leader>hp", function()
   require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
keymap.set("n", "<leader>hb", function()
   require("gitsigns").blame_line { full = true }
end, { desc = "Blame line" })
keymap.set("n", "<leader>hB", function()
   require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame" })
keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })

--  ───────────────────────────[ comment boxes ]───────────────────────────
keymap.set({ "n", "v" }, "<leader>Cb", "<cmd>CBllbox19<CR>", { desc = "Insert a default comment box" })

--  ───────────────────────────[ comment lines ]───────────────────────────
keymap.set({ "n", "v" }, "<leader>Cl", "<cmd>CBccline6<CR>", { desc = "Insert a default comment line" })

--  ────────────────────────────[ icon picker ]────────────────────────────
keymap.set("n", "<Leader>i", "<cmd>IconPickerNormal<cr>", { desc = "Open icon picker" })
keymap.set("n", "<Leader>iy", "<cmd>IconPickerYank<cr>", { desc = "Yank icon into register" }) --> Yank the selected icon into register
-- keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", { desc = "Pick Icon to Insert" })
