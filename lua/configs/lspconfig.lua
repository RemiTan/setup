local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local capabilities = require("blink.cmp").get_lsp_capabilities()

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
}

-- list of servers configured with default config.
local default_servers = {}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        enable = true, -- Disable all diagnostics from lua_ls
        -- globals = { "vim" },
      },
      hint = { enable = true },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/love2d/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.ruff.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  trace = "messages",

  init_options = {
    settings = {
      logLevel = "debug",
    },
  },
  settings = {
    ruff = {
      filetypes = { "python" },
      settings = {
        ruff = {
          completion = { callSnippet = "Replace" },
        },
      },
    },
  },
}

lspconfig.basedpyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    filetypes = { "python" },
    basedpyright = {
      disableOrganizeImports = true,
      inlayHints = {
        variableTypes = true,
        functionReturnTypes = true,
        parameterTypes = true,
      },
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "basic", -- Disable type checking
        diagnosticSeverityOverrides = {
          reportAttributeAccessIssue = false,
          reportArgumentType = false,
          reportUnreachable = false,
        },
      },
    },
    python = {
      pythonPath = "~/miniconda3/envs/csu/bin/python",
    },
  },
}
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--
--   settings = {
--     filetypes = { "python" },
--     pyright = {
--       disableorganizeimports = true,
--       inlayHints = {
--         variableTypes = true,
--         functionReturnTypes = true,
--         parameterTypes = true,
--       },
--     },
--     python = {
--       analysis = {
--         ignore = { "*" },
--       },
--       pythonPath = "~/miniconda3/envs/csu/bin/python",
--     },
--   },
-- }

local signs = {
  error = "",
  warn = "",
  hint = "󰌵",
  info = "",
}

vim.diagnostic.config {
  virtual_text = {
    prefix = function(diagnostic)
      return signs[vim.diagnostic.severity[diagnostic.severity]]
    end,
    format = function(diagnostic)
      -- Append the error code to the message if available
      if diagnostic.code then
        return string.format("%s: %s", diagnostic.code, diagnostic.message)
      else
        return diagnostic.message
      end
    end,
  },
}

local debounce_timer = nil

-- after a delay, call diagnostics
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function()
    if debounce_timer then
      debounce_timer:stop()
      debounce_timer = nil
    end

    debounce_timer = vim.loop.new_timer()
    debounce_timer:start(
      1000,
      0,
      vim.schedule_wrap(function()
        vim.diagnostic.show()
      end)
    )
  end,
})

-- call diagnostic on save
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.diagnostic.show()
  end,
})

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}
require("telescope").load_extension "ui-select"
