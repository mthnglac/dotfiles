local Type = {
  GLOBAL_OPTION = 'o',
  WINDOW_OPTION = 'wo',
  BUFFER_OPTION = 'bo',
}

local add_options = function (option_type, options)
  if type(options) ~= 'table' then
    error('options should be a type of "table"')
    return
  end

  local vim_option = vim[option_type]

  for key, value in pairs(options) do
    vim_option[key] = value
  end
end

local Option = {}

Option.g = function (options)
  add_options(Type.GLOBAL_OPTION, options)
end

Option.w = function (options)
  add_options(Type.WINDOW_OPTION, options)
end

Option.b = function (options)
  add_options(Type.BUFFER_OPTION, options)
end

return Option
