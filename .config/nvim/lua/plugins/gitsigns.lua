return {
   "lewis6991/gitsigns.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      {
         "purarue/gitsigns-yadm.nvim",
         opts = {
            shell_timeout_ms = 1000,
         },
      },
   },
   event = { "BufReadPre", "BufNewFile" },
   opts = {
      _on_attach_pre = function(_, callback)
         if vim.fn.executable "yadm" == 1 then
            require("gitsigns-yadm").yadm_signs(callback)
         else
            callback()
         end
      end,
      on_attach = function(bufnr)
         local gs = package.loaded.gitsigns

         local function map(mode, l, r, desc)
            vim.keuymap.set(mode, l, r, { buffer = bufnr, desc = desc })
         end

         map("n", "]h", gs.next_hunk, "Next Hunk")
         map("n", "[h", gs.prev_hunk, "Prev Hunk")

         map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
         map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
         map("v", "<leader>hs", function()
            gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
         end, "Reset Hunk")

         map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
         map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
         map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
         map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

         map("n", "<leader>hb", function()
            gs.blame_line { full = true }
         end, "Blame line")

         map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

         map("n", "<leader>hd", gs.diffthis, "Diff this")
         map("n", "<leader>hD", function()
            gs.diffthis "~"
         end, "Diff this ~")

         map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
   },

   config = function()
      local gitsigns = require "gitsigns"

      gitsigns.setup {
         signs = {
            add = { text = "+" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
         },
         signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
         numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
         linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
         word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
         watch_gitdir = {
            interval = 1000,
            follow_files = true,
         },
         attach_to_untracked = true,
         current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
         current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 200,
            ignore_whitespace = false,
         },
         current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
         sign_priority = 6,
         update_debounce = 100,
         status_formatter = nil, -- Use default
         max_file_length = 40000, -- Disable if file is longer than this (in lines)
         preview_config = {
            -- Options passed to nvim_open_win
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
         },
      }
   end,
}
