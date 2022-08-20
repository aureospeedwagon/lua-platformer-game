function spawnExtraLife(x, y, value)
    local extraLife = {}

    local extraLifeBody = love.physics.newBody(world, x, y, "static")
    local extraLifeShape = love.physics.newRectangleShape(10, 10)
    local extraLifeFixture = love.physics.newFixture(extraLifeBody, extraLifeShape)
    extraLifeFixture:setUserData({'collectable', 'extraLife', value})
    extraLifeFixture:setSensor(true)

    extraLife.body = extraLifeBody
    extraLife.shape = extraLifeShape
    extraLife.fixture = extraLifeFixture
    extraLife.draw = function()
        if extraLife.body:isActive() then
            love.graphics.rectangle("line", extraLife.body:getX(), extraLife.body:getY(), 10, 10, 3, 3)
            love.graphics.rectangle("fill", extraLife.body:getX() + 0, extraLife.body:getY() + 4, 10, 2, 3, 3)
            love.graphics.rectangle("fill", extraLife.body:getX() + 4, extraLife.body:getY() + 0, 2, 10, 3, 3)
        end
    end

    return extraLife

end
