local mason_nvim_dap = require("mason-nvim-dap")
local dap_utils = require("dap.utils")

mason_nvim_dap.setup({
  ensure_installed = { "js-debug-adapter" },
  automatic_installation = false,
  handlers = {
    function(config)
      -- all sources with no handler get passed here

      -- Keep original functionality
      mason_nvim_dap.default_setup(config)
    end,
    js = function(config)
      config.name = "pwa-node"
      config.adapters = {
        type = "server",
        host = "::1",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      config.configurations = {
        {
          name = "Launch file",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          -- For this to work you need to make sure the node process is started with the `--inspect` flag.
          name = "Attach to process",
          type = "pwa-node",
          request = "attach",
          processId = dap_utils.pick_process,
        },
      }

      config.filetypes = { "javascript", "typescript" }

      mason_nvim_dap.default_setup(config)
    end,
  },
})
