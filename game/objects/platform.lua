function spawnPlatform(x, y, tlx, tly, trx, try, brx, bry, blx, bly)
    local platform = {}

    local platformBody = love.physics.newBody(world, x, y, "static")
    local platformShape = love.physics.newPolygonShape(tlx, tly, trx, try, brx, bry, blx, bly)
    local platformFixture = love.physics.newFixture(platformBody, platformShape)
    platformFixture:setUserData({'platform'})

    platform.body = platformBody
    platform.shape = platformShape
    platform.fixture = platformFixture
    platform.draw = function()
        love.graphics.polygon("fill", platform.body:getX(), platform.body:getY(), platform.body:getWorldPoints(platform.shape:getPoints()))
    end

    return platform

end
