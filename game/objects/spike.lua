function spawnSpike(x, y, blx, bly, tcx, tcy, brx, bry)
    local spike = {}

    local spikeBody = love.physics.newBody(world, x, y, "static")
    local spikeShape = love.physics.newPolygonShape(blx, bly, tcx, tcy, brx, bry)
    local spikeFixture = love.physics.newFixture(spikeBody, spikeShape)
    spikeFixture:setUserData({'enemy', 'spike'})

    spike.body = spikeBody
    spike.shape = spikeShape
    spike.fixture = spikeFixture
    spike.draw = function()
        love.graphics.polygon("fill", spike.body:getX(), spike.body:getY(), spike.body:getWorldPoints(spike.shape:getPoints()))
    end

    return spike

end
