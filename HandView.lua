constants = require "constants"

local HandView = {}

function HandView:new(hand, offsetX, offsetY, scaleX, scaleY)
    o = {
        openImage = love.graphics.newImage(constants.handOpenPath),
        closedImage = love.graphics.newImage(constants.handClosedPath),
        hand = hand,
        offsetX = offsetX,
        offsetY = offsetY,
        scaleX = scaleX,
        scaley = scaleY
    }
    setmetatable(o, self)
    self.__index = self
    return o
end


function HandView:getImage()
    if self.hand:getImage() == constants.handOpen then
        return self.openImage
    else
        return self.closedImage
    end
end

return HandView
