-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightowl",

  hl_override = {
    comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

-- Icon definitions for the dashboard
M.icon = function(file, icon_type)
  local icons = {
    file = "", -- Default icon for files
    directory = "", -- Default icon for directories
    text = "", -- Text file
    markdown = "", -- Markdown file
    lua = "", -- Lua file
    python = "", -- Python file
    html = "", -- HTML file
    css = "", -- CSS file
    js = "", -- JavaScript file
    json = "", -- JSON file
    image = "", -- Image file
    binary = "", -- Binary file
    default = "", -- Fallback for unknown types
  }

  if icon_type == "file" then
    local ext = vim.fn.fnamemodify(file, ":e")
    return icons[ext] or icons.default
  elseif icon_type == "directory" then
    return icons.directory
  end

  return icons.default
end

return M
