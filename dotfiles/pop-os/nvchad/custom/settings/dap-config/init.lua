return {
  config = function()
    local dap, dapui = require "dap", require "dapui"
    local command = os.getenv "PYENV_ROOT" .. "/debugpy/bin/python"

    -- ADAPTERS
    dap.adapters.python = {
      type = "executable",
      command = command,
      args = { "-m", "debugpy.adapter" },
    }

    -- CONFIGS
    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
    }

    --[[ dap.adapters.java = function(callback)
      callback {
        type = "server",
        host = "127.0.0.1",
        port = 5005,
      }
    end

    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
    } ]]

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "WarningMsg" })
    vim.fn.sign_define("DapBreakpointLog", { text = "", texthl = "ErrorMsg" })

    -- DAP UI
    require("dapui").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
  end,
}
