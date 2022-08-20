function love.gamepadpressed(joystick, button)
    if button == 'back' then
        love.event.quit()
    end

    if started == false then
        started = true
        level = 1
        spawnLevel1()
    elseif goalwin and paused then
        goalwin = false
        paused = false
    elseif dead and paused then
        levels[level].destroy()
        levels[level] = spawnLevel(level)()
        dead = false
        paused = false
    
    elseif gamewin then -- don't fall through to game controls
    elseif gameover then -- don't fall through to game controls
    else

        xNow, yNow = player.body:getLinearVelocity()
        if button == 'a' and math.abs(yNow) < 1 then
            player.body:applyLinearImpulse(0, JUMP_POWER)
        elseif button == 'dpleft' then
            player.body:setLinearVelocity(SPEED * -1, yNow)
        elseif button == 'dpright' then
            player.body:setLinearVelocity(SPEED, yNow)
        elseif button == 'start' then
            paused = not paused
        end
    end
end

function love.gamepadreleased(joystick, button)
    xNow, yNow = player.body:getLinearVelocity()

    if button == 'dpleft' then
        player.body:setLinearVelocity(0, yNow)
    elseif button == 'dpright' then
        player.body:setLinearVelocity(0, yNow)
    end

end

-- TODO: delete keyboard controls later?
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if started == false then
        started = true
        level = 1
        spawnLevel1()
    elseif goalwin and paused then
        goalwin = false
        paused = false
    elseif dead and paused then
        levels[level].destroy()
        levels[level] = spawnLevel(level)()
        dead = false
        paused = false
    elseif gamewin then -- don't fall through to game controls
    elseif gameover then -- don't fall through to game controls
    else

        xNow, yNow = player.body:getLinearVelocity()

        if (key == 'space' or key == 'up') and math.abs(yNow) < 1 then
            player.body:applyLinearImpulse(0, JUMP_POWER)
        elseif key == 'left' then
            player.body:setLinearVelocity(SPEED * -1, yNow)
        elseif key == 'right' then
            player.body:setLinearVelocity(SPEED, yNow)
        elseif key == 'return' then
            paused = not paused
        end
    end
end

function love.keyreleased(key)
    xNow, yNow = player.body:getLinearVelocity()

    if key == 'left' then
        player.body:setLinearVelocity(0, yNow)
    elseif key == 'right' then
        player.body:setLinearVelocity(0, yNow)
    end

end
