function spawnCoin(x, y, r, value)
    local coin = {}

    local coinBody = love.physics.newBody(world, x, y, "static")
    local coinShape = love.physics.newCircleShape(r)
    local coinFixture = love.physics.newFixture(coinBody, coinShape)
    coinFixture:setUserData({'collectable', 'coin', value})
    coinFixture:setSensor(true)

    coin.body = coinBody
    coin.shape = coinShape
    coin.fixture = coinFixture
    coin.draw = function()
        if coin.body:isActive() then
            love.graphics.circle("fill", coin.body:getX(), coin.body:getY(), coin.shape:getRadius())
        end
    end

    return coin

end
