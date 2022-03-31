local Type = {
  GLOBAL_VARIABLE = 'g',
  WINDOW_VARIABLE = 'w',
  BUFFER_VARIABLE = 'b',
  TAB_PAGE_VARIABLE = 't',
  VIM_VARIABLE = 'v',
}

local function add_variables (variable_type, variables)
  if type(variables) ~= 'table' then
    error('variables should be a type of "table"')
    return
  end

  for key, value in pairs(variables) do
    vim[variable_type][key] = value
  end
end

local Variable = {}

Variable.g = function (variables)
  add_variables(Type.GLOBAL_VARIABLE, variables)
end

Variable.w = function (variables)
  add_variables(Type.WINDOW_VARIABLE, variables)
end

Variable.b = function (variables)
  add_variables(Type.BUFFER_VARIABLE, variables)
end

Variable.t = function (variables)
  add_variables(Type.TAB_PAGE_VARIABLE, variables)
end

Variable.v = function (variables)
  add_variables(Type.VIM_VARIABLE, variables)
end

return Variable
