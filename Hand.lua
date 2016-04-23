local constants = require "constants"

local Hand = {
    width = 32,
    height = 32,
    image = handOpen
}

function Hand:new(o)
    -- return Icon:new{image = handOpenPath}
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Hand:setImage(isOpen)
    if isOpen then
        self.image = handOpen
    else
        self.image = handClosed
    end
end

function Hand:getImage()
    return self.image
end

return Hand