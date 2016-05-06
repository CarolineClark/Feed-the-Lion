constants = require "constants"

local LionView = {}

function LionView:new(lion, offsetX, offsetY, scaleX, scaleY)
    local x = 10
    local y = 10

    o = {
        happyImage = love.graphics.newImage(constants.handOpenPath),
        sadImage = love.graphics.newImage(constants.handClosedPath),
        angryImage = love.graphics.newImage(constants.handClosedPath),
        neutralImage = love.graphics.newImage(constants.handClosedPath),
        lion = lion,
        offsetX = offsetX,
        offsetY = offsetY,
        scaleX = scaleX,
        scaley = scaleY,
        x = x,
        y = y
    }
    setmetatable(o, self)
    self.__index = self
    return o
end


function LionView:getImage()
    if self.lion:getExpression() == constants.lionHappy then
        return self.happyImage
    elseif self.lion:getExpression() == constants.lionSad then
        return self.sadImage
    elseif self.lion:getExpression() == constants.lionAngry then
        return self.angryImage
    else
        return self.neutralImage
    end
end

return LionView
