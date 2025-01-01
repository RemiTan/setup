local options = {
  ensure_installed = {
    "python",
    "json",
    "dockerfile",
    "yaml",
    "lua",
    "luadoc",
    "markdown",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
}

require("nvim-treesitter.configs").setup(options)
