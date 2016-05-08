constants = require "constants"

local LionView = {}

function LionView:new(lion, scaleX, scaleY)
    local x = 150
    local y = 150

    o = {
        happyImage = love.graphics.newImage(constants.lionHappyPath),
        sadImage = love.graphics.newImage(constants.handClosedPath),
        angryImage = love.graphics.newImage(constants.handClosedPath),
        neutralImage = love.graphics.newImage(constants.lionNeutralPath),
        lion = lion,
        scaleX = scaleX,
        scaleY = scaleY,
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
