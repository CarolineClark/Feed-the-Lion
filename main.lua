Food = require "Food"
Hand = require "Hand"
HandView = require "HandView"

function love.load()
    love.graphics.setFont(love.graphics.newFont(11))

    meat = Food:new()
    hand = Hand:new()
    handView = HandView:new(hand, 10, 50, 0.25, 0.25)

    meatImg = love.graphics.newImage(meat.imgPath)

end

function love.draw()

    if love.mouse.isDown(1) then
        meat.x = love.mouse.getX()
        meat.y = love.mouse.getY()
    end

    hand:setImage(not love.mouse.isDown(1))

    local handPosX = love.mouse.getX() - handView.offsetX
    local handPosY = love.mouse.getY() - handView.offsetY

    love.graphics.draw(meatImg,
        meat.x - 20,
        meat.y - 65,
        0,
        0.3,
        0.3
    )
    love.graphics.draw(
        handView:getImage(),
        handPosX,
        handPosY,
        0,
        handView.scaleX,
        handView.scaleY
    )

    love.graphics.print(meat.x, 50, 50)
    love.graphics.print(hand:getImage(), 50, 100)
end