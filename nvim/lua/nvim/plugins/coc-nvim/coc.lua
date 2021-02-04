local v = vim
local a = vim.api
local e = vim.api.nvim_eval
local c = vim.cmd

local Coc = {}

Coc.is_pum_visible = function()
    return  (e('pumvisible()') > 0)
end

Coc.is_rpc_ready = function()
	return e('coc#rpc#ready()') > 0
end

--[[
-- Returns boolean
-- IF cursor is on white space charactor, true will be returned
-- IF cursor is on non white space charactor, false will be returned
--
-- @returns boolean
--]]
Coc.go_to_next_completion_item = function(org_input)
	-- go to next item if completion menu visible
	if Coc.is_pum_visible() then
		a.nvim_input('<c-n>')

	-- if current charactor is white space, input the original user input
	elseif Editor.is_curr_char_space() then
        a.nvim_input(org_input)

	-- refresh the coc completion menu
	else
		e('coc#refresh()')
	end
end

Coc.go_to_previous_completion_item = function(org_input)
    if Coc.is_pum_visible() then
		a.nvim_input('<c-p>')
    else
        a.nvim_input(org_input)
    end
end

Coc.select_completion_item = function(org_input)
    if Coc.is_pum_visible() then
		e('coc#_select_confirm()')
    else
        a.nvim_input(org_input)
    end
end

Coc.show_documentation = function()
	local filetype = v.bo.filetype

	if filetype == 'vim' or filetype == 'help' then
		local cword = e('expand("<cword>")')
		c('help ' .. cword)
	elseif Coc.is_rpc_ready() then
		e("CocActionAsync('doHover')")
	else
		-- following will run "man" in vim
		local keywordprg = v.o.keywordprg
		local cword = e('expand("<cword>")')
		c(string.format('%s %s', keywordprg, cword))
	end
end

Coc.format_code = function()
	e('CocAction("format")')
end

return Coc
