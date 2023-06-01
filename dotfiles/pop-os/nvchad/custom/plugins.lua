-- custom/plugins/init.lua
-- we're basically returning a table!

return {
  -- JSON schemas
  ["b0o/schemastore.nvim"] = {},

  -- Flutter mobile dev
  ["akinsho/flutter-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.settings.flutter-tools-config"
    end,
  },

  -- Godot
  ["lommix/godot.nvim"] = {
    config = function()
      require "custom.settings.godot-config"
    end,
  },

  -- Java
  ["mfussenegger/nvim-jdtls"] = {},
  ["mikelue/vim-maven-plugin"] = {},

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.settings.null-ls-config"
    end,
  },

  -- LSP / CMP
  ["williamboman/mason.nvim"] = require "custom.settings.mason-config",

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.settings.lsp-config"
    end,
  },

  ["hrsh7th/nvim-cmp"] = require "custom.settings.cmp-config",

  ["rafamadriz/friendly-snippets"] = {},

  -- Code runner
  ["CRAG666/code_runner.nvim"] = require "custom.settings.code-runner",

  -- UI
  ["godlygeek/tabular"] = {},

  ['nacro90/numb.nvim'] = {
    config = function ()
      require('numb').setup()
    end
  },

  ["mrjones2014/nvim-ts-rainbow"] = {
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          -- ...
        },
        -- ...
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
      }
    end,
  },

  ["nvim-tree/nvim-tree.lua"] = require "custom.settings.nvimtree-config",

  ["nvim-treesitter/nvim-treesitter"] = require "custom.settings.treesitter-config",

  ["benfowler/telescope-luasnip.nvim"] = {},
  ["nvim-telescope/telescope-ui-select.nvim"] = {},
  ["nvim-telescope/telescope.nvim"] = require "custom.settings.telescope-config",

  ["xiyaowong/nvim-transparent"] = require "custom.settings.nvim-transparent-config",

  -- Debug
  ["theHamsta/nvim-dap-virtual-text"] = require "custom.settings.dap-config.virtual-text",

  ["rcarriga/nvim-dap-ui"] = {},
  ["mfussenegger/nvim-dap"] = require "custom.settings.dap-config",
}
