return {
    config = function()
      require("code_runner").setup {
        mode = "float",
        focus = true,
        float = {
          close_key = "<ESC>",
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },

          height = 0.5,
          width = 0.5,
          x = 0.5,
          y = 0.5,

          -- Highlight group for floating window/border (see ':h winhl')
          border_hl = "FloatBorder",
          float_hl = "Normal",

          -- Transparency (see ':h winblend')
          blend = 0,
        },
        filetype = {
          java = "java -cp $(pwd)/target/classes com.koeila.drawmath.app.Main",
          python = "python3 -u",
          typescript = "deno run",
          rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        },
      }
    end,
}
