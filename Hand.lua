local constants = require "constants"

local Hand = {
    image = constants.handOpen
}

function Hand:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Hand:setImage(isOpen)
    if isOpen then
        self.image = constants.handOpen
    else
        self.image = constants.handClosed
    end
end

function Hand:getImage()
    return self.image
end

return Hand