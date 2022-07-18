-- speed up loading Lua modules
if pcall(require, "impatient") then
	require("impatient").enable_profile()
else
	print("Failed to load impatient.")
end

-- packer settings & plugins
require("install-plugins")

-- generics
require("utils")

-- vim core settings
require("general")
