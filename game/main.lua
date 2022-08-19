function love.load()
    require "world-config"
    worldConfig()
    love.physics.setMeter(10) -- meter is 10 px/units
    world = love.physics.newWorld(0, 9.81 * love.physics.getMeter(), false)

    require "controls"
    require "collision"
    world:setCallbacks(onCollision)

    require "objects/walls"
    loadWalls()
    require "objects/character"
    require "objects/goal"
    require "objects/platform"
    require "objects/spike"
    require "levels/levels"
    require "levels/level1"
    require "levels/level2"
    require "levels/level3"

    time = 0

    gamewin = false
    goalwin = false
    hitgoal = false

    hitenemy = false
    dead = false
    lives = 3

    gameover = false

    level = 0
    levels = {}
    started = false
    paused = false

end

function love.draw(screen)
    -- render only top screen
    if screen ~= "bottom" then

        displaytime = math.floor(time)

        if not started then
            love.graphics.print('A Game, technically', 20, 120, 0, 2, 2)
            love.graphics.print('press any key', 150, 200)
        end

        if paused and (not gamewin) and (not goalwin) and (not dead) and (not gameover) then
            love.graphics.print('paused', 100, 120, 0, 3, 3)
        end

        if paused and goalwin then
            love.graphics.print('GOAL!', 100, 120, 0, 3, 3)
            love.graphics.print('press any key to continue', 100, 200)
        end

        if paused and dead then
            love.graphics.print('DEAD!', 100, 120, 0, 3, 3)
            love.graphics.print('press any key to continue', 100, 200)
        end

        if gamewin then
            love.graphics.print('GAME WIN!', 100, 120, 0, 3, 3)
        end

        if gameover then
            love.graphics.print('GAME OVER!', 100, 120, 0, 3, 3)
        end

        -- draw Walls
        walls.draw()

        -- draw level
        if started and (not paused) then
            if levels[level] then
                love.graphics.print('life x' .. lives, 350, 3)
                love.graphics.print('level' .. level, 3, 3)
                levels[level].draw()
            end
        end
    end
end

function love.update(dt)
    if (not paused) then
        world:update(dt)
        time = time + 1 * dt

        if hitgoal then
            level = level + 1
            spawnNextLevel = spawnLevel(level)
            if (spawnNextLevel) then
                levels[level - 1].destroy()
                spawnNextLevel()
                goalwin = true
                paused = true
            else
                gamewin = true
                paused = true
            end
            hitgoal = false
        end
        if hitenemy then
            lives = lives - 1
            if lives > 0 then
                dead = true
                paused = true
            else
                gameover = true
                paused = true
            end
            hitenemy = false
        end
    end
end

