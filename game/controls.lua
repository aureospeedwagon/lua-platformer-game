function love.gamepadpressed(joystick, button)
    if button == 'back' then
        love.event.quit()
    end

    if started == false then
        started = true
        level = 6
        spawnLevel6()
    elseif goalwin and paused then
        goalwin = false
        paused = false
    elseif dead and paused then
        levels[level].destroy()
        levels[level] = spawnLevel(level)()
        dead = false
        paused = false
    elseif key == 'return' then
        paused = not paused
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if started == false then
        started = true
        level = 6
        spawnLevel6()
    elseif goalwin and paused then
        goalwin = false
        paused = false
    elseif dead and paused then
        levels[level].destroy()
        levels[level] = spawnLevel(level)()
        dead = false
        paused = false
    elseif key == 'return' then
        paused = not paused
    end
end

