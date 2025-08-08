return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("lazydev").setup({
      library = { "nvim-dap-ui" },
    })

    require("dapui").setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.70,
            },
            {
              id = "breakpoints",
              size = 0.10,
            },
            {
              id = "stacks",
              size = 0.10,
            },
            {
              id = "watches",
              size = 0.10,
            },
          },
          position = "left",
          size = 30,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    })

    require("dap").adapters.codelldb = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
      -- may need to enable on laptop, but I use wsl so we'll see.
      -- detached = false,
    }

    require("dap").configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
          )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    require("dap").configurations.odin = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
          )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    require("dap").listeners.before.attach.dapui_config = function()
      require("dapui").open()
    end
    require("dap").listeners.before.launch.dapui_config = function()
      require("dapui").open()
    end
    require("dap").listeners.before.event_terminated.dapui_config = function()
      require("dapui").close()
    end
    require("dap").listeners.before.event_exited.dapui_config = function()
      require("dapui").close()
    end

    vim.keymap.set(
      "n",
      "<leader>tb",
      require("dap").toggle_breakpoint,
      { desc = "[t]oggle [b]reakpoint" }
    )
    vim.keymap.set(
      "n",
      "<leader>dc",
      require("dap").continue,
      { desc = "[d]ebugger [c]ontinue/start" }
    )
    vim.keymap.set(
      "n",
      "<leader>sd",
      "<cmd>DapTerminate<cr>",
      { desc = "[s]top [d]ebugger" }
    )
    vim.keymap.set("n", "N", require("dap").step_over)
    vim.keymap.set("n", "<leader>i", require("dap").step_into)
    vim.keymap.set("n", "<leader>o", require("dap").step_out)
  end,
}
