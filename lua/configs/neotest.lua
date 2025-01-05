require("neotest").setup {
  log_level = vim.log.levels.debug,
  adapters = {
    require "neotest-python" {
      dap = { justmycode = false },
      args = { "--log-level", "debug", "--quiet" },
      runner = "pytest",
      python = ".venv/pytest/bin/python",
    },
  },
  output = {
    enabled = true, -- enable output viewing
    open_on_run = true, -- automatically open output when a test is run
  },
}
