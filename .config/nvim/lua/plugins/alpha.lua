return {
   'goolord/alpha-nvim',
   event = 'VimEnter',

   config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
         ' @@@@@@@   @@@@@@@@   @@@@@@@   @@@@@@@@  @@@@@@@@   @@@@@@   @@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@   ',
         '@@@@@@@@  @@@@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@@  ',
         '!@@       @@!   @@@@  @@!  @@@  @@!       @@!       @@!  @@@    @@!    @@!  @@@  @@!       @@!  @@@  ',
         '!@!       !@!  @!@!@  !@!  @!@  !@!       !@!       !@!  @!@    !@!    !@!  @!@  !@!       !@!  @!@  ',
         '!@!       @!@ @! !@!  @!@  !@!  @!!!:!    @!!!:!    @!@!@!@!    @!!    @!@!@!@!  @!!!:!    @!@!!@!   ',
         '!!!       !@!!!  !!!  !@!  !!!  !!!!!:    !!!!!:    !!!@!!!!    !!!    !!!@!!!!  !!!!!:    !!@!@!    ',
         ':!!       !!:!   !!!  !!:  !!!  !!:       !!:       !!:  !!!    !!:    !!:  !!!  !!:       !!: :!!   ',
         ':!:       :!:    !:!  :!:  !:!  :!:       :!:       :!:  !:!    :!:    :!:  !:!  :!:       :!:  !:!  ',
         ' ::: :::  ::::::: ::   :::: ::   :: ::::   ::       ::   :::     ::    ::   :::   :: ::::  ::   :::  ',
         ' :: :: :   : : :  :   :: :  :   : :: ::    :         :   : :     :      :   : :  : :: ::    :   : :  ',
         '                                                                                                     ',
         '                                                                             [danesi.dev]            ',
      }

      dashboard.section.buttons.val = {
         dashboard.button('n', '  > New File', '<cmd>ene<CR>'),
         dashboard.button('e', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
         dashboard.button('o', '󰙰  > Recent files', '<cmd>Telescope oldfiles<cr>'),
         dashboard.button('f', '󰱼  > Find File', '<cmd>Telescope find_files<CR>'),
         dashboard.button('s', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
         dashboard.button('r', '󰑓  > Open last session', '<cmd>SessionRestore<CR>'),
         dashboard.button('R', '󰁯  > Restore a Previous Session', '<cmd>Telescope session-lens<CR>'),
         dashboard.button('q', '  > Quit NVIM', '<cmd>qa<CR>'),
      }

      alpha.setup(dashboard.opts)

      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
   end,
}
