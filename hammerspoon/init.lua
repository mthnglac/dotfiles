hs.loadSpoon("Vifari")
spoon.Vifari:start() -- this will add hooks. `:stop()` to remove hooks

-- or if you want to customize it
spoon.Vifari:start({
    -- example your local config here
    scrollStep = 150,  -- Change scroll step
    mapping = {
        ["j"] = "cmdScrollDownFast",  -- Change existing mapping
        ["n"] = { "cmd", "n" },       -- Add new mapping
        ["x"] = false,                -- Disable a mapping
    }
})
