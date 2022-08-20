function spawnPlayer(x, y)
    player = {}

    playerbody = love.physics.newBody(world, x, y, "dynamic", 5, 0) -- WALLS
    playerbody:setFixedRotation( true)
    playershape = love.physics.newPolygonShape(0, 0, 0, 7, 7, 7, 7, 0)
    playerfixture = love.physics.newFixture(playerbody, playershape)
    playerfixture:setUserData({'player'})

    player.body = playerbody
    player.shape = playershape
    player.fixture = playerfixture
    player.draw = function()
        love.graphics.polygon("fill", player.body:getX(), player.body:getY(), player.body:getWorldPoints(player.shape:getPoints()))
    end

    return player
end