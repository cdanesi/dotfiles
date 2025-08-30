return {
   'tpope/vim-fugitive',
   dependencies = {
      'purarue/yadm-git.vim',
      config = function()
         vim.g.yadm_git_enabled = 1
         vim.g.yadm_git_fugitive_enabled = 1
         vim.g.yadm_git_gutter_enabled = 1
         vim.g.yadm_repo_path = '~/.local/share/yadm/repo.git/'
      end
   },
   cmd = {
      'Git',
      'Gdiffsplit',
      'Gedit',
      'Gvdiffsplit',
      'Gread',
      'Gwrite',
      'Ggrep',
      'GMove',
      'GDelete',
      'GBrowse',
   },
}