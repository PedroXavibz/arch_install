local jdtls = require "jdtls"

-- Workspace
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv "HOME" .. "/Dev/java/workspace/" .. project_name

-- Debug
local java_debug_ms = os.getenv "HOME"
  .. "/builds/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.44.0.jar"
local java_debug_vs = os.getenv "HOME"
  .. "/builds/vscode-java-test/server/com.microsoft.java.test.runner-jar-with-dependencies.jar"
local bundles = {
  vim.fn.glob(java_debug_ms, 1),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(java_debug_vs, 1), "\n"))

-- Java bin
local jdtls_location = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local jdtls_bin = jdtls_location .. "/bin/jdtls"
local jdtls_jar = jdtls_location .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local jdtls_configuration = jdtls_location .. "/config_linux"

return {
  cmd = { jdtls_bin,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    "-jar",
    jdtls_jar,

    "-configuration",
    jdtls_configuration,

    "-data",
    workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

  settings = {
    java = {
      signatureHelp = { enabled = true },

      completion = {
        favoriteStaticMembers = {},
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },

      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },

      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },

  init_options = {
    bundles = bundles,
  },

  on_attach = function(client, bufnr)
    jdtls.setup_dap { hotcodereplace = "auto" }
    jdtls.setup.add_commands()
    jdtls.dap.setup_dap_main_class_configs()
  end,
}
