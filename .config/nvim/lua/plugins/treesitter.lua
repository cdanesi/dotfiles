local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "bash",
    "cmake",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitcommit",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "nginx",
    "perl",
    "php",
    "python",
    "regex",
    "sql",
    "ssh_config",
    "todotxt",
    "typescript",
    "vim",
    "xml",
    "yaml",
  },
  auto_install = true,
})
