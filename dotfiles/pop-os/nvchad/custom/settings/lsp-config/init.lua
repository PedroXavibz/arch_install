-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "gopls",

  "rust_analyzer",

  "clangd",
  "cmake",

  "omnisharp",

  "jdtls",

  -- Mobile
  "dartls",

  -- Web
  "html",
  "cssls",
  "tsserver",
  "jsonls",
  "dockerls",
  "emmet_ls",
  "dotls",
  -- "denols",

  -- Vim / Lua / Stuff
  "lua_ls",
  "vimls",
  "taplo",

  -- Python
  "pyright",
}

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "lua_ls" then
    local sumneko_opts = require "custom.settings.lsp-config.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if lsp == "jsonls" then
    local jsonls_opts = require "custom.settings.lsp-config.jsonls_lua"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if lsp == "omnisharp" then
    local omnisharp_opts = require "custom.settings.lsp-config.omnisharp_lua"
    opts = vim.tbl_deep_extend("force", omnisharp_opts, opts)
  end

  lspconfig[lsp].setup(opts)
end

local luasnip = require "luasnip"
luasnip.filetype_extend("dart", { "flutter" })
require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/lua/custom/snippets" } }
