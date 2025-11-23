local neotest = require("neotest")
local neotest_jest = require("neotest-jest")
local neotest_jest_util = require("neotest-jest.jest-util")
local neotest_python = require("neotest-python")
local neotest_plenary = require("neotest-plenary")
local neotest_vim = require("neotest-vim-test")
local neotest_ruby = require("neotest-ruby-minitest")

neotest.setup({
  adapters = {
    neotest_jest({
      jestCommand = "npm test --",
      -- @param defaultArguments string[]
      -- @param context neotest.RunContext
      jestArguments = function(defaultArguments, _)
        return defaultArguments
      end,
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      -- @param path string
      cwd = function(_)
        return vim.fn.getcwd()
      end,
      isTestFile = neotest_jest_util.defaultIsTestFile,
    }),
    neotest_python({
      dap = { justMyCode = false },
    }),
    neotest_plenary,
    neotest_vim({
      ignore_file_types = { "python", "vim", "lua" },
    }),
    neotest_ruby({
      command = "bundle exec ruby -Itest",
    }),
  },
})
