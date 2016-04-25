-- TODO this is very similar to HandView, refactor

local FoodView = {}

function FoodView:new(x, y, scaleX, scaleY, imgPath)
    o = {
        x = x,
        y = y,
        scaleX = scaleX,
        scaleY = scaleY,
        image = love.graphics.newImage(imgPath)
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function FoodView:isMouseOver(x, y)
    local meatX0 = self.x
    local meatY0 = self.y
    local meatX1 = self.x + self.image:getWidth() * self.scaleX
    local meatY1 = self.y + self.image:getHeight() * self.scaleY

    local isXOverMeat = x > meatX0 and x < meatX1
    local isYOverMeat = y > meatY0 and y < meatY1

    local mouseOverMeat = false

    if isXOverMeat and isYOverMeat then
        mouseOverMeat = true
    end

    return mouseOverMeat
end

return FoodView
