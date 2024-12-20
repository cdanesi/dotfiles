return {
   -- TODO: replace with toggleterm or something similar..
   'kdheepak/lazygit.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
   },
   cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
   },
}
