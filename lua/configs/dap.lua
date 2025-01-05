local dap = require "dap"
local dapui = require "dapui"
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "BreakpointHighlight", linehl = "", numhl = "" })
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "", texthl = "BreakpointConditionHighlight", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "LogHighlight", linehl = "", numhl = "" })
vim.fn.sign_define(
  "DapStopped",
  { text = "", texthl = "DebugHighlight", linehl = "DebugHighlight", numhl = "DebugHighlight" }
)

-- Function to clear signs and highlights
local function clear_dap_signs()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.fn.sign_unplace("dap", { buffer = bufnr })
  vim.api.nvim_buf_clear_namespace(bufnr, 0, 0, -1)
end

vim.cmd [[
  hi DebugHighlight guibg=#3c3836 guifg=#fbf1c7 gui=bold
  hi BreakpointHighlight guifg=#CD1C18
  hi BreakpointConditionHighlight guifg=#FFBF00
  hi LogHighlight guifg=#305CDE
      ]]
