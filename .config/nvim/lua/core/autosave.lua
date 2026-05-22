local group = vim.api.nvim_create_augroup('NotesAutosave', { clear = true })

local note_filetypes = {
   markdown = true,
   telekasten = true,
}

local function should_save(buf)
   if not vim.api.nvim_buf_is_valid(buf) then return false end
   if not note_filetypes[vim.bo[buf].filetype] then return false end
   if not vim.bo[buf].modified then return false end
   if vim.bo[buf].readonly or not vim.bo[buf].modifiable then return false end
   if vim.api.nvim_buf_get_name(buf) == '' then return false end
   return true
end

local function save(buf)
   if should_save(buf) then vim.api.nvim_buf_call(buf, function()
      vim.cmd('silent! write')
   end) end
end

vim.api.nvim_create_autocmd({
   'BufLeave',
   'WinLeave',
   'FocusLost',
   'InsertLeave',
}, {
   group = group,
   callback = function(args)
      save(args.buf)
   end,
})

vim.api.nvim_create_autocmd({
   'CursorHold',
   'CursorHoldI',
}, {
   group = group,
   callback = function(args)
      save(args.buf)
   end,
})
