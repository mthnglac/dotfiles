local Worktree = require("git-worktree")

Worktree.setup({
	update_on_change_command = "",
})

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
	if op == Worktree.Operations.Switch then
		print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
	end
end)
