-- speed up loading Lua modules
if pcall(require, "impatient") then
	require("impatient").enable_profile()
else
	print("Failed to load impatient.")
end

-- generics
require("utils")

-- packer settings & plugins
require("install-plugins")

-- vim core settings
require("general")
