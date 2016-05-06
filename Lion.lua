local constants = require "constants"

local Lion = {
    expression = constants.lionHappy
}

function Lion:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Lion:setHappy()
    Lion:setExpression(constants.lionHappy)
end

function Lion:setNeutral()
    Lion:setExpression(constants.lionNeutral)
end

function Lion:setExpression(expression)
    self.expression = expression
end

function Lion:getExpression()
    return self.expression
end

return Lion
