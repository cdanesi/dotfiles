return {
   "ThePrimeagen/harpoon",
   branch = "harpoon2",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
   },

   config = function()
      local harpoon = require("harpoon")
      local map = vim.keymap

      harpoon:setup()

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
         local file_paths = {}
         for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
         end

         require("telescope.pickers")
            .new({}, {
               prompt_title = "Harpoon",
               finder = require("telescope.finders").new_table({
                  results = file_paths,
               }),
               previewer = conf.file_previewer({}),
               sorter = conf.generic_sorter({}),
            })
            :find()
      end

      map.set("n", "<leader>a", function()
         harpoon:list():add()
      end, { desc = "Harpoon this" })
      map.set("n", "<C-e>", function()
         toggle_telescope(harpoon:list())
      end, { desc = "Harpoon UI" })
      map.set("n", "<C-S-!>", function()
         harpoon:list():select(1)
      end, { desc = "Mark 1" })
      map.set("n", "<C-S-2>", function()
         harpoon:list():select(2)
      end, { desc = "Mark 2" })
      map.set("n", "<C-S-3>", function()
         harpoon:list():select(3)
      end, { desc = "Mark 3" })
      map.set("n", "<C-S-4>", function()
         harpoon:list():select(4)
      end, { desc = "Mark 4" })
      map.set("n", "<C-S-{>", function()
         harpoon:list():prev()
      end, { desc = "Cycle back" })
      map.set("n", "<C-S-}>", function()
         harpoon:list():next()
      end, { desc = "Cycle forward" })
   end,
}