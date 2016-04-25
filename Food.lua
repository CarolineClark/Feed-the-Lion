constants = require "constants"

local Food = {
    x = 100,
    y = 100,
    imgPath = constants.meatPath
}

function Food:new()
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Food
