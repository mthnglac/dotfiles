local neotest = require("neotest")
local neotest_jest = require("neotest-jest")
local neotest_jest_util = require("neotest-jest.jest-util")
local neotest_python = require("neotest-python")
local neotest_plenary = require("neotest-plenary")
local neotest_vim_test = require("neotest-vim-test")

neotest.setup({
  adapters = {
    neotest_jest({
      jestCommand = "npm test --",
      jestArguments = function(defaultArguments, context)
        return defaultArguments
      end,
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
      isTestFile = neotest_jest_util.defaultIsTestFile,
    }),
    neotest_python({
      dap = { justMyCode = false },
    }),
    neotest_plenary,
    neotest_vim_test({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
