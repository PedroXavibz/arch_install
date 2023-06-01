return {
  override_options = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- vim
      "vim-language-server",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "eslint_d",
      "deno",
      "emmet-ls",
      "taplo",
      "yaml-language-server",
      "elm-format",
      "json-lsp",
      "fixjson",
      "dot-language-server",

      -- java
      "jdtls",

      -- python
      "pyright",
      "flake8",
      "mypy",
      "pydocstyle",
      "autopep8",

      -- rust
      "rust-analyzer",
      "rustfmt",

      -- java
      "jdtls",

      -- shell
      "bash-language-server",
      "shfmt",
      "shellcheck",

      -- C / C++
      "clangd",
      "clang-format",
      "cmake-language-server",
    },
  },
}
