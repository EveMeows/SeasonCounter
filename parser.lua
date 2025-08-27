local parser = {}
parser.__index = parser

function parser:new()
  local p = { options = {} }
  return setmetatable(p, parser)
end

function parser:push(name, callback, isFlag)
  self.options["--" .. name] = {
    callback = callback,
    flag = isFlag,
  }
end

function parser:parse(args)
  local value = false

  for i, arg in ipairs(args) do
    if value then 
      value = false
      goto continue 
    end
    
    local opt = self.options[arg]
    if opt == nil then
      print("Unrecognised flag or option: " .. arg)
      goto continue 
    end

    if not opt.flag then
      local arg = args[i + 1]
      opt.callback(arg)

      value = true
      goto continue
    end

    opt.callback()
    ::continue::
  end
end

return parser
