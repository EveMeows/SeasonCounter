local count = {}

-- We have to add 1 because days in dst are offset by 1 day.
local __sizes = {
  ["default"] = {
    { name = "autumn", days = 21 },
    { name = "winter", days = 16 },
    { name = "spring", days = 21 },
    { name = "summer", days = 16 },
  },

  ["veryshort"] = {
    { name = "autumn", days = 6 },
    { name = "winter", days = 6 },
    { name = "spring", days = 6 },
    { name = "summer", days = 6 },
  },

  ["short"] = {
    { name = "autumn", days = 13 },
    { name = "winter", days = 11 },
    { name = "spring", days = 13 },
    { name = "summer", days = 11 },
  },
  
  ["long"] = {
    { name = "autumn", days = 31 },
    { name = "winter", days = 23 },
    { name = "spring", days = 31 },
    { name = "summer", days = 23 },
  },
  
  ["verylong"] = {
    { name = "autumn", days = 51 },
    { name = "winter", days = 41 },
    { name = "spring", days = 51 },
    { name = "summer", days = 41 },
  },
}

function count:crunch(data)
  local seasonSize = __sizes[data.size]
  if seasonSize == nil then
    print("Unknown season size: " .. data.size .. ".\nKnown season sizes: [veryshort, short, default, long, verylong]")
    os.exit(1)
  end

  local c = 0
  local szn = ""
  while true do
    for _,season in ipairs(seasonSize) do
      if c + season.days > data.day then
        szn = season.name
        goto finish
      end
      
      c = c + season.days
    end
  end

  ::finish::
  print("Day " .. data.day .. " is in " .. szn)
end

return count
