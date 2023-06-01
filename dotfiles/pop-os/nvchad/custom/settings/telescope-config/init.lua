return {
  override_options = function()
    local telescope = require "telescope"
    telescope.load_extension "ui-select"
    telescope.load_extension "flutter"
    telescope.load_extension "luasnip"

    return {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            winblend = 10,
            border = true,
            previewer = true,
            layout_config = {
              prompt_position = "top",
            },
            width = 0.8,
            results_title = false,
            preview_cutoff = 120,
          },
        },
      },
    }
  end,
}
