constants = require "constants"
Icon = require "Icon"
Hand = require "Hand"

function love.load()
    love.graphics.setFont(love.graphics.newFont(11))

    icon1 = Icon:new()
    hand = Hand:new()

    handOpenImage = love.graphics.newImage(handOpenPath)
    handClosedImage = love.graphics.newImage(handClosedPath)

end

function getHandImage()
    if hand:getImage() == handOpen then
        return handOpenImage
    else
        return handClosedImage
    end
end

function love.draw()

    if love.mouse.isDown(1) then
        icon1.x = love.mouse.getX()
        icon1.y = love.mouse.getY()
    end

    hand:setImage(not love.mouse.isDown(1))

    love.graphics.rectangle("fill", icon1.x - 10, icon1.y - 10, icon1.width, icon1.height)
    love.graphics.draw(getHandImage(), love.mouse.getX() - 10, love.mouse.getY() - 50, 0, 0.25, 0.25)

    love.graphics.print(icon1.x, 50, 50)
    love.graphics.print(hand:getImage(), 50, 100)
end