return {
  override_options = function()
    local cmp = require "cmp"

    return {
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-8),
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer" },
      },
    }
  end,
}
