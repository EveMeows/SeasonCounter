local parser = require 'parser'
local count  = require 'count'

local helpString = [[Don't starve together season counter (v1.0)

Easily see what season falls on a certain day.

Options:
  --day [DAY int] which day to count. [default 1]
  --size [SEASON string] which season size to count. [default "default"]
      OPTIONS: [veryshort, short, default, long, verylong]

Flags:
  --help Display this message.

Miaumiaumiaumiaumiauiamkittymeowmoemwoew]]

local data = {
  day = 1,
  size = "default",
}

local args = parser:new()
args:push("day", function(day)
  data.day = tonumber(day)
end, false)

args:push("size", function(size)
  data.size = size
end, false)

args:push("help", function()
  print(helpString)
  os.exit(0)
end, true)

args:parse(arg)

-- Fallbacks
if data.size == nil then
  print("No size specified.")
  os.exit(1)
end

if data.day == nil then
  print("No day specified.")
  os.exit(1)
end

if data.day <= 0 then
  print("The day cannot be 0 or less.")
  os.exit(1)
end

-- Yummy
count:crunch(data)
