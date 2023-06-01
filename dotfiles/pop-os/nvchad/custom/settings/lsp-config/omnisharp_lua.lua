local nvim_lsp = require "lspconfig"

local pid = vim.fn.getpid()
local omnisharp_bin = vim.fn.stdpath "data" .. "/mason/bin/omnisharp"

return {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  root_dir = nvim_lsp.util.root_pattern("*.sln", "*.csproj", "project.json", "Packages") or vim.loop.cwd,
}
