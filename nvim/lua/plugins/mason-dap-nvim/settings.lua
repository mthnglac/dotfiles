require('mason-nvim-dap').setup({
  ensure_installed = { 'js-debug-adapter' },
  automatic_installation = false,
  handlers = {

    function(config)
      -- all sources with no handler get passed here

      -- Keep original functionality
      require('mason-nvim-dap').default_setup(config)
    end,
    js = function(config)
      config.adapters = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = "node",
          args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", '${port}' },
        }
      }
      -- config.configurations.javascript = {
      --   {
      --     type = "pwa-node",
      --     request = "launch",
      --     name = "Launch file",
      --     program = "${file}",
      --     cwd = "${workspaceFolder}",
      --   },
      -- }
      -- config.configurations.typescript = {
      --   {
      --     type = "pwa-node",
      --     request = "launch",
      --     name = "Launch file",
      --     program = "${file}",
      --     cwd = "${workspaceFolder}",
      --   },
      -- }
      require('mason-nvim-dap').default_setup(config) -- don't forget this!
    end,
  },
})
