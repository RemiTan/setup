require "nvchad.options"

local o = vim.o
local opt = vim.opt
local api = vim.api

-- indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.cursorline = true
o.cursorlineopt = "number,line"

opt.relativenumber = true
opt.scrolloff = 8

api.nvim_create_autocmd("textyankpost", {
  desc = "highlight when yanking (copying) text",
  group = api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.cmd [[
    highlight DiagnosticVirtualTextError guifg=#FF5F5F guibg=#2F2F2F
    highlight DiagnosticVirtualTextWarn guifg=#FFD700 guibg=#2F2F2F
    highlight DiagnosticVirtualTextInfo guifg=#87CEEB guibg=#2F2F2F
    highlight DiagnosticVirtualTextHint guifg=#98FB98 guibg=#2F2F2F
]]
