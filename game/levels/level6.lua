function spawnLevel6()
    levels[6] = {}
    levels[6].player = spawnPlayer(15, 230)
    levels[6].goal = spawnGoal(385, 225)
    levels[6].platform1 = spawnMovingPlatform(50, 200, 0, 0, 0, 20, 20, 20, 20, 0, 350, 100, 5)

    levels[6].draw = function()
        levels[6].player.draw()
        levels[6].platform1.draw()
        levels[6].goal.draw()
    end

    levels[6].destroy = function()
        levels[6].player.body:destroy()
        levels[6].goal.body:destroy()
        levels[6].platform1.body:destroy()
    end

    levels[6].update = function(dt)
        levels[6].platform1.update(dt)
    end

    return levels[6]
end
