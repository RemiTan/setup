return {
  {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.substitute"
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    enabled = false,
    version = "*",
    config = function()
      require "configs.blink"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
    config = function()
      require "configs.cmp-cmdline"
    end,
  },
  -- {
  --   "hrsh7th/cmp-nvim-lsp",
  --   enabled = false,
  -- },
  -- {
  --   "hrsh7th/cmp_luasnip",
  --   enabled = false,
  -- },
  -- {
  --   "hrsh7th/cmp-cmdline",
  --   enabled = false,
  -- },
  -- {
  --   "hrsh7th/cmp-buffer",
  --   enabled = false,
  -- },
  -- {
  --   "hrsh7th/cmp-nvim-lua",
  --   enabled = false,
  -- },
  -- {
  --   "hrsh7th/cmp-nvim-lua",
  --   enabled = false,
  -- },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "folke/snacks.nvim",
    priority = 1000,
    dependencies = {
      "rmagatti/auto-session",
      "kdheepak/lazygit.nvim",
    },
    lazy = false,
    config = function()
      require "configs.snacks"
    end,
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VimEnter",
    lazy = true,
    config = function()
      require "configs.treesitter-textobjects"
    end,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require "configs.auto-session"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require "configs.nvim-dap-virtual-text"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.neotest"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.todo-comments"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.dap-python"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    -- nvim v0.8.0
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    opts = {},
    cmd = { "Oil" },
    config = function()
      require "configs.oil"
    end,
  },
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require "configs.mini"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufReadPre" },
    config = function()
      require "configs.treesitter"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      {
        "L3MON4D3/LuaSnip",
        version = "*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
    },
    config = function()
      require "configs.nvim-cmp"
    end,
  },
}
