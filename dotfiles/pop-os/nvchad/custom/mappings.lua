-- lua/custom/mappings
local M = {}

-- add this table only when you want to disable default keys
--[[ M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<C-s>"] = ""
  }
} ]]

M.abc = {
  n = {
    ["<leader>q"] = { "<cmd>:q<CR>", "Exit neovim" },

    -- Copy | Paste
    ["<leader>y"] = { '"+y', "Copy to clipboard" },
    ["<leader>p"] = { '"+p', "Paste content into clipboard" },
    ["<leader>P"] = { '"+P', "Paste content into clipboard" },

    -- Move text up and down
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move line down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move line up" },

    -- Toggle transparent
    ["<leader>tg"] = { "<cmd>TransparentToggle<CR>", "Toggle transparent" },

    -- Telescope flutter commands
    ["<leader>tf"] = { "<cmd>Telescope flutter commands<CR>", "Flutter commands" },

    -- Code runner
    ["<leader>rn"] = { "<cmd>RunCode<CR>", "Run code" },

    -- DAP
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "DAP: Toggle breakpoint" },
    ["<leader>dB"] = {
      "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      "DAP: Breakpoint log",
    },
    ["<leader>dc"] = { "<cmd>DapContinue<CR>", "DAP: Continue" },
    ["<leader>dr"] = {"<cmd>DapToggleRepl<CR>", "DAP: Toggle Repl"},
    ["<leader>dl"] = { "<cmd>lua require('dap').run_last()<CR>", "DAP: Run last" },

    ["<F1>"] = { "<cmd>DapContinue<CR>", "DAP: Continue" },
    ["<F2>"] = { "<cmd>DapStepInto<CR>", "DAP: Step into (Enter code)" },
    ["<F3>"] = { "<cmd>DapStepOut<CR>", "DAP: Step out (Exit code)" },
    ["<F4>"] = { "<cmd>DapStepOver<CR>", "DAP: Step over (Exit debug)" },

    ["<leader>du"] ={"<cmd>lua require('dapui').toggle()<CR>", "DAP: toggle UI"},
  },
  i = {},
  v = {
    -- Copy | Paste
    ["<leader>y"] = { '"+y', "Copy to clipboard" },
    ["<leader>p"] = { '"+p', "Paste content into clipboard" },
    ["<leader>P"] = { '"+P', "Paste content into clipboard" },

    -- Move text up and down
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move line down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move line up" },
  },
}

M.xyz = {
  -- stuff
}

return M
