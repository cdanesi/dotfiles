return {
  'ziontee113/icon-picker.nvim',
  dependencies = {
    'stevearc/dressing.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    disable_legacy_commands = true,
  },
}