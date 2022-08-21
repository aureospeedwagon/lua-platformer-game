function spawnMovingPlatform(initX, initY, tlx, tly, trx, try, brx, bry, blx, bly, moveToX, moveToY, period)
    local platform = spawnPlatform(initX, initY, tlx, tly, trx, try, brx, bry, blx, bly)
    platform.fixture:setUserData({'platform', 'moving'})
    platform.fixture:setFriction(1)
    platform.body:setType('kinematic')
    platform.xdirection = 0
    platform.ydirection = 0

    if (initX < moveToX) then
        print('init to the right')
        platform.xdirection = 1
    else
        print('init to the left')
        platform.xdirection = -1
    end

    platform.update = function(dt)

        local xd = math.abs(initX - moveToX)
        local yd = math.abs(initY - moveToY)

        local currentX = platform.body:getX()
        local currentY = platform.body:getY()

        if (initX < moveToX) then
            if currentX <= initX  then
                platform.xdirection = 1
            elseif currentX >= moveToX then
                platform.xdirection = -1
            end
        elseif (initX > moveToX) then
            if currentX >= initX then
                platform.xdirection = -1
            elseif currentX <= moveToX then
                platform.xdirection = 1
            end
        end
                
        if (initY < moveToY) then
            if currentY <= initY  then
                platform.ydirection = 1
            elseif currentY >= moveToY then
                platform.ydirection = -1
            end
        elseif (initY > moveToY) then
            if currentY >= initY then
                platform.ydirection = -1
            elseif currentY <= moveToY then
                platform.ydirection = 1
            end
        end

        local xspeed = (xd/period)*platform.xdirection
        local yspeed = (yd/period)*platform.ydirection
        
        platform.body:setLinearVelocity(xspeed, yspeed)

    end

    return platform

end
