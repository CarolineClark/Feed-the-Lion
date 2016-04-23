Button = require "Button"

function love.load()
    button1 = Button:new{
        x = 0,
        y = 0,
        width = 32,
        height = 32
    }

    cursor = {
        width = 32,
        segments = 5
    }
end

function love.draw()

    if love.mouse.isDown(1) then
        button1.x = love.mouse.getX()
        button1.y = love.mouse.getY()
    end
    
    love.graphics.rectangle("fill", button1.x, button1.y, button1.width, button1.height)
    love.graphics.circle("fill", love.mouse.getX(), love.mouse.getY(), cursor.width, cursor.segments)
end