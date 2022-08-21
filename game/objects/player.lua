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

    player.update = function(dt)
        print('player update')
        xNow, yNow = player.body:getLinearVelocity()



        local _, BUTTON_A = joystick:getGamepadMapping('a')
        local _, _, HAT_LEFT = joystick:getGamepadMapping('dpleft')
        local _, _, HAT_RIGHT = joystick:getGamepadMapping('dpright')
        local HAT_DIR = joystick:getHat(1)

        if (love.keyboard.isDown('space') or love.keyboard.isDown('up') or joystick:isDown(BUTTON_A)) and math.abs(yNow) < 1 then
            player.body:applyLinearImpulse(0, JUMP_POWER)
        elseif love.keyboard.isDown('left') or HAT_DIR == HAT_LEFT then
            player.body:setLinearVelocity(SPEED * -1, yNow)
        elseif love.keyboard.isDown('right') or HAT_DIR == HAT_RIGHT then
            player.body:setLinearVelocity(SPEED, yNow)
        else
            player.body:setLinearVelocity(0, yNow)
        end
    
    end

    return player
end