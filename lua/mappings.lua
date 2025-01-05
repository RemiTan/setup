require "nvchad.mappings"

local bo = vim.bo
-- add yours here

local map = vim.keymap.set

map("n", "<leader>sk", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "inlay hint" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<leader>sv", "<C-w>v", { desc = "split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "split horizontally", remap = true })

-- Increase/Decrease split height
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase split height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease split height" })

-- Increase/Decrease split width
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease split width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase split width" })

map("n", "<C-c>", "<Nop>", { desc = "stop flashing" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "s", "<Nop>", { desc = "remove s" })

map("n", "<M-j>", "<cmd> cnext <CR>", { desc = "next fix" })
map("n", "<M-k>", "<cmd> cprev <CR>", { desc = "prev fix" })

map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>rn", "<leader>ra", { desc = "LSP diagnostic loclist", remap = true })
map("n", "<C-k>", "<C-s>", { desc = "LSP signature help", remap = true })
map("i", "<C-k>", "<C-s>", { desc = "LSP signature help", remap = true })

map("n", "<leader>x", ":.lua<CR>", { desc = "execute" })
map("v", "<leader>x", ":lua<CR>", { desc = "execute" })
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "execute" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>cb", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>cc", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>cc", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope [F]ind [B]uffers" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "telescope find keymaps" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "telescope find resume" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "telescope find word" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "telescope find diagnostics" })
map("n", "<leader>fs", "<cmd>Telescope builtin<CR>", { desc = "telescope find builtin" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "telescope [F]ind [C]urrent word" })
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "telescope todo-comments" })

map("n", '<leader>f"', "<cmd>Telescope registers<CR>", { desc = "telescope [F]ind registers" })

map("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "telescope [F]ind [Q]uickfix" })
map("n", "<leader>fQ", "<cmd>Telescope quickfixhistory<CR>", { desc = "telescope [F]ind [Q]uickfix history" })

map("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "telescope todo-comments" })
map("n", "gI", "<cmd>Telescope lsp_implementations<CR>", { desc = "telescope todo-comments" })

map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "telescope todo-comments" })

map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    wind_blend = 10,
    previewer = false,
  })
end, { desc = "Fuzzily search in current buffer" })

map("n", "<leader>f/", function()
  require("telescope.builtin").live_grep {
    grep_open_files = true,
    prompt_tile = "Live Grep In Open Files",
  }
end, { desc = "[F]ind in [/] Open Files" })

map("n", "<leader>fn", function()
  require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "[F]ind [N]eovim config" })

map("n", "<leader>fg", function()
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local make_entry = require "telescope.make_entry"
  local conf = require("telescope.config").values
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "multi grep",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end, { desc = "find by Grep" })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>ht", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>vt", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

map("n", "<leader>gt", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "whichkey all keymaps" })

--------------OIL--------------------
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

--------------HARPOON-------------------

map("n", "<leader>a", function()
  require("harpoon"):list():add()
end, { desc = "Harpoon [A]dd" })

map("n", "<leader>hh", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle quick menu [H]arpoon" })

map("n", "<M-a>", function()
  require("harpoon"):list():select(1)
end, { desc = "Select 1 menu [H]arpoon" })

map("n", "<M-z>", function()
  require("harpoon"):list():select(2)
end, { desc = "select 2 menu [h]arpoon" })

map("n", "<M-e>", function()
  require("harpoon"):list():select(3)
end, { desc = "Select 3 menu [H]arpoon" })

map("n", "<M-r>", function()
  require("harpoon"):list():select(4)
end, { desc = "Select 4 menu [H]arpoon" })

map("n", "<C-S-P>", function()
  require("harpoon"):list():prev()
end, { desc = "Select prev menu [H]arpoon" })

map("n", "<C-S-N>", function()
  require("harpoon"):list():next()
end, { desc = "Select next menu [H]arpoon" })

---------------DAP-----------------------

map("n", "<leader>tc", function()
  if bo.filetype == "python" then
    require("dap-python").test_class()
  end
end, { desc = "Run [T]est [C]lass" })

map("n", "<leader>td", function()
  local current_dir = vim.fn.expand "%:p:h" -- Get current file's directory
  -- vim.fn.system(string.format("pytest -n 4 %s", current_dir))
  -- print("Running tests in directory: " .. current_dir)
  require("dap").run {
    type = "python",
    request = "launch",
    program = "pytest",
    args = { current_dir },
    console = "integratedTerminal",
  }
  print("Debugging tests in directory: " .. current_dir)
end, { desc = "Run [T]est [D]irectory" })

map("n", "<leader>dtc", function()
  require("neotest").run.run { vim.fn.expand "%", strategy = "dap" } -- Run the nearest test
end, { desc = "Run Debugging [T]est [C]lass" })

map("n", "<leader>dtm", function()
  require("neotest").run.run { strategy = "dap" } -- Run the nearest test
  if bo.filetype == "python" then
    require("dap-python").test_method()
  end
end, { desc = "Run Debugging [T]est [M]ethod" })

map("n", "<leader>dbr", function()
  require("dap").repl.open()
end, { desc = "[D]e[b]ugger Toggle [R]EPL" })

map("n", "<leader>drl", function()
  require("dap").run_last()
end, { desc = "[D]e[b]ugger Toggle [R]un [L]ast" })

map("n", "<leader>dbb", function()
  require("dap").toggle_breakpoint()
end, { desc = "[D]e[b]ugger Toggle [B]reakpoint" })

map("n", "<leader>dbc", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "[D]e[b]ugger set [C]onditional Breakpoint" })

map("n", "<F1>", function()
  require("dap").continue()
end, { desc = "Continue Debugging" })

map("n", "<F2>", function()
  require("dap").step_over()
end, { desc = "Step Over" })

map("n", "<F3>", function()
  require("dap").step_into()
end, { desc = "Step Into" })

map("n", "<F4>", function()
  require("dap").step_out()
end, { desc = "Step Out" })

map("n", "<F5>", function()
  require("dap").step_back()
end, { desc = "Step Back" })

map("n", "<F6>", function()
  require("dap").restart()
end, { desc = "Step Back" })

map("n", "<leader>?", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "Step Back" })

map("n", "<leader>dq", function()
  require("dap").terminate()
  print "Debug session terminated and UI closed"
end, { desc = "Terminate Debugging Session and Close UI" })

map("n", "<leader>dl", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Set Log Point" })

map("n", "<leader>dbx", function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.fn.sign_unplace("dap", { buffer = bufnr })
  vim.api.nvim_buf_clear_namespace(bufnr, 0, 0, -1)
end, { desc = "remove breakpoints" })
---- Neotest

map("n", "<leader>tn", function()
  require("neotest").run.run() -- Run the nearest test
end, { desc = "Run Nearest Test" })

map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%") -- Run all tests in the current file
end, { desc = "Run All Tests in File" })

map("n", "<leader>ts", function()
  require("neotest").summary.toggle() -- Toggle test summary window
end, { desc = "Toggle Test Summary" })

map("n", "<leader>to", function()
  require("neotest").output.open { enter = true, auto_close = true } -- Open test output
end, { desc = "Show Test Output" })

map("n", "<leader>to", function()
  require("neotest").output.open() -- Open test output
end, { desc = "Show Test Output" })

map("n", "<leader>tl", function()
  require("neotest").run.run_last() -- Open test output
end, { desc = "Run Last Test" })

map("n", "<leader>tx", function()
  require("neotest").run.stop() -- Open test output
end, { desc = "Stop run" })

map("n", "<leader>td", function()
  require("neotest").diagnostic() -- Open test output
end, { desc = "diagnostic" })

map("n", "<leader>tw", function()
  require("neotest").watch.watch() -- Open test output
end, { desc = "Watch a test" })

map("n", "<leader>tX", function()
  require("neotest").run.stop() -- Open test output
end, { desc = "Stop watch" })

map("n", "<leader>tW", function()
  require("neotest").watch.toggle(vim.fn.expand "%") -- Open test output
end, { desc = "Watch a test" })
----
map("n", "<leader>]t", function()
  require("todo-comments").jump_next()
end, { desc = "jump to next todo" })

map("n", "<leader>[t", function()
  require("todo-comments").jump_prev()
end, { desc = "jump to previous todo" })

--- auto session

map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

--- gitsigns

map("n", "]h", function()
  require("gitsigns").next_hunk()
end, { desc = "Next Hunk" })
map("n", "[h", function()
  require("gitsigns").prev_hunk()
end, { desc = "Prev Hunk" })

-- Actions
map("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })

map("v", "<leader>hs", function()
  require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Stage hunk" })
map("v", "<leader>hr", function()
  require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Reset hunk" })

map("n", "<leader>hS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
map("n", "<leader>hR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })

map("n", "<leader>hu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })

map("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })

map("n", "<leader>hb", function()
  require("gitsigns").blame_line { full = true }
end, { desc = "Blame line" })
map("n", "<leader>hB", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame" })

map("n", "<leader>hd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff this" })

map("n", "<leader>hD", function()
  require("gitsigns").diffthis "~"
end, { desc = "Diff this ~" })

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })

-- snacks
map("n", "<leader>gg", function()
  require("snacks").lazygit()
end, { desc = "lazy git" })

map("n", "<leader>gl", function()
  require("snacks").lazygit.log()
end, { desc = "lazy git log" })

map("n", "<leader>gf", function()
  require("snacks").lazygit.log_file()
end, { desc = "lazy git log file" })

map("n", "<leader>gB", function()
  require("snacks").gitbrowse()
end, { desc = "lazy git browse" })

-- noice
map("n", "<leader>nh", "<cmd>Telescope notify<CR>", { desc = "Notification history" })
