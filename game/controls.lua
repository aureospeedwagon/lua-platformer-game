function love.gamepadpressed(joystick, button)
    if started == false then
        started = true
        level = 1
        spawnLevel1()
    elseif goalwin and paused then 
        goalwin = false
        paused = false
    else

        xNow, yNow = character.body:getLinearVelocity()
        if button == 'a' and math.abs(yNow) < 1 then
            character.body:applyLinearImpulse(0, JUMP_POWER)
        elseif button == 'dpleft' then
            character.body:setLinearVelocity(SPEED*-1, yNow)
        elseif button == 'dpright' then
            character.body:setLinearVelocity(SPEED, yNow)
        elseif button == 'start' then
            paused = not paused
        elseif button == 'back' then
            love.event.quit()
        end
    end
end

function love.gamepadreleased(joystick, button)
    xNow, yNow = character.body:getLinearVelocity()

    if button == 'dpleft' then
        character.body:setLinearVelocity(0, yNow)
    elseif button == 'dpright' then
        character.body:setLinearVelocity(0, yNow)
    end

end

-- TODO: delete keyboard controls later?
function love.keypressed(key)
    if started == false then
        started = true
        level = 3
        spawnLevel3()
    elseif goalwin and paused then 
        goalwin = false
        paused = false
    elseif dead and paused then 
        levels[level].destroy()
        levels[level] = spawnLevel(level)()
        dead = false
        paused = false
    else

        xNow, yNow = character.body:getLinearVelocity()

        if key == 'space' and math.abs(yNow) < 1 then
            character.body:applyLinearImpulse(0, JUMP_POWER)
        elseif key == 'left' then
            character.body:setLinearVelocity(SPEED*-1, yNow)
        elseif key == 'right' then
            character.body:setLinearVelocity(SPEED, yNow)
        elseif key == 'return' then
            paused = not paused
        elseif key == 'escape' then
            love.event.quit()
        end
    end
end

function love.keyreleased(key)
    xNow, yNow = character.body:getLinearVelocity()

    if key == 'left' then
        character.body:setLinearVelocity(0, yNow)
    elseif key == 'right' then
        character.body:setLinearVelocity(0, yNow)
    end

end