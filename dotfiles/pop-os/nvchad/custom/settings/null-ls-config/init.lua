local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettier,
  b.formatting.eslint_d,
  b.formatting.fixjson,
  b.formatting.yamlfmt,
  b.diagnostics.eslint_d,

  -- go
  b.formatting.golines,
  b.formatting.goimports,

  -- rust
  b.formatting.rustfmt,

  -- dart
  b.formatting.dart_format,

  -- python
  -- b.diagnostics.mypy,
  -- b.diagnostics.pydocstyle,
  b.formatting.autopep8,
  -- b.formatting.reorder_python_imports,
  b.diagnostics.flake8,

  -- C / C++
  b.formatting.clang_format,

  b.formatting.elm_format,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
