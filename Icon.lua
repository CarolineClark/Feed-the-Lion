local Icon = {
    x = 100,
    y = 100,
    width = 32,
    height = 32
}

function Icon:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Icon