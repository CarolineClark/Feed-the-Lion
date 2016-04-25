Food = require "Food"
Hand = require "Hand"
HandView = require "HandView"
FoodView = require "FoodView"

function love.load()
    love.graphics.setFont(love.graphics.newFont(11))

    meat = Food:new()
    hand = Hand:new()
    handView = HandView:new(hand, 10, 50, 0.25, 0.25)
    meatView = FoodView:new(100, 100, 0.3, 0.3, meat.imgPath)

end

function love.draw()

    hand:setImage(not love.mouse.isDown(1))
    local handPosX = love.mouse.getX() - handView.offsetX
    local handPosY = love.mouse.getY() - handView.offsetY

    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    local mouseOverMeat = meatView:isMouseOver(mouseX, mouseY)

    if love.mouse.isDown(1) and mouseOverMeat then
        meatView.x = mouseX - 20
        meatView.y = mouseY - 65
        -- meatView.x = mouseX
        -- meatView.y = mouseY
    end

    love.graphics.draw(
        meatView.image,
        meatView.x,
        meatView.y,
        0,
        meatView.scaleX,
        meatView.scaleY
    )

    love.graphics.draw(
        handView:getImage(),
        handPosX,
        handPosY,
        0,
        handView.scaleX,
        handView.scaleY
    )

    love.graphics.print(meatView.x, 50, 50)
    love.graphics.print(hand:getImage(), 50, 100)
    love.graphics.print(tostring(mouseOverMeat), 50, 150)
    love.graphics.print(meatView.scaleY, 50, 200)
end
