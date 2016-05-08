Food = require "Food"
Hand = require "Hand"
Lion = require "Lion"
HandView = require "HandView"
FoodView = require "FoodView"
LionView = require "LionView"

function love.load()
    love.graphics.setFont(love.graphics.newFont(11))

    meat = Food:new()
    hand = Hand:new()
    lion = Lion:new()
    handView = HandView:new(hand, 10, 50, 0.25, 0.25)
    meatView = FoodView:new(100, 100, 0.3, 0.3, meat.imgPath)
    lionView = LionView:new(lion, 0.6, 0.6)
    meatMoving = false
end

function love.update()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()

    local mouseOverMeat = meatView:isMouseOver(mouseX, mouseY)

    if not meatMoving and love.mouse.isDown(1) and mouseOverMeat then
        meatMoving = true
    elseif not love.mouse.isDown(1) then
        meatMoving = false
    end

    -- Calculate if the meat is above the lion
    local widthOfLion = lionView:getImage():getWidth() * lionView.scaleX
    local heightOfLion = lionView:getImage():getHeight() * lionView.scaleY
    if lionView.x <= meatView.x and lionView.x + widthOfLion >= meatView.x and lionView.y <= meatView.y and lionView.y + heightOfLion >= meatView.y then
        lion:setHappy()
    else
        lion:setNeutral()
    end
end

function love.draw()

    hand:setImage(not love.mouse.isDown(1))
    local handPosX = love.mouse.getX() - handView.offsetX
    local handPosY = love.mouse.getY() - handView.offsetY

    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()

    if meatMoving then
        meatView.x = mouseX - 20
        meatView.y = mouseY - 65
    end

    love.graphics.draw(
        lionView:getImage(),
        lionView.x,
        lionView.y,
        0,
        lionView.scaleX,
        lionView.scaleY
    )

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
    love.graphics.print(hand:getImage(), 50, 75)
    love.graphics.print(tostring(meatMoving), 50, 100)
    love.graphics.print(meatView.scaleY, 50, 125)
    love.graphics.print(lion:getExpression(), 50, 150)
end
