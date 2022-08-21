function spawnLevel5()
    levels[5] = {}
    levels[5].player = spawnPlayer(15, 230)
    levels[5].goal = spawnGoal(385, 225)
    levels[5].extraLife = spawnExtraLife(185, 200, 1)

    levels[5].draw = function()
        levels[5].player.draw()
        levels[5].extraLife.draw()
        levels[5].goal.draw()
        love.graphics.print('life = good', 170, 180)
    end

    levels[5].destroy = function()
        levels[5].player.body:destroy()
        levels[5].extraLife.body:destroy()
        levels[5].goal.body:destroy()
    end

    levels[5].update = function(dt)
        levels[5].player.update(dt)
    end

    return levels[5]
end
