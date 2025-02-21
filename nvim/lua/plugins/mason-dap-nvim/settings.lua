local mason_nvim_dap = require('mason-nvim-dap')

mason_nvim_dap.setup({
  ensure_installed = { 'js-debug-adapter' },
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
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = "node",
          args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", '${port}' },
        }
      }

      config.configurations = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        }
      }

      config.filetypes = { "javascript", "typescript" }

      mason_nvim_dap.default_setup(config)
    end,
  },
})
