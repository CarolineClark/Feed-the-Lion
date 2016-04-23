Icon = require "Icon"
Hand = require "Hand"
HandView = require "HandView"

function love.load()
    love.graphics.setFont(love.graphics.newFont(11))

    icon1 = Icon:new()
    hand = Hand:new()
    handView = HandView:new(hand, 10, 50, 0.25, 0.25)

end

function love.draw()

    if love.mouse.isDown(1) then
        icon1.x = love.mouse.getX()
        icon1.y = love.mouse.getY()
    end

    hand:setImage(not love.mouse.isDown(1))

    local handPosX = love.mouse.getX() - handView.offsetX
    local handPosY = love.mouse.getY() - handView.offsetY

    love.graphics.rectangle("fill", icon1.x - 10, icon1.y - 10, icon1.width, icon1.height)
    love.graphics.draw(
        handView:getImage(),
        handPosX,
        handPosY,
        0,
        handView.scaleX,
        handView.scaleY
    )

    love.graphics.print(icon1.x, 50, 50)
    love.graphics.print(hand:getImage(), 50, 100)
end