local dap = require("dap")

--[[
#-------------------------------------------------------------------------#
#                                    ADAPTERS                             #
#-------------------------------------------------------------------------#
--]]
dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}",
  executable = {
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", '${port}' },
  }
}

--[[
#-------------------------------------------------------------------------#
#                                    CONFS                                #
#-------------------------------------------------------------------------#
--]]
dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
