function spawnLevel2()
    levels[2] = {}
    levels[2].player = spawnPlayer(15, 230)
    levels[2].goal = spawnGoal(385, 225)
    levels[2].platform1 = spawnPlatform(180, 200, 0, 0, 0, 50, 40, 50, 40, 0)

    levels[2].draw = function()
        levels[2].player.draw()
        levels[2].platform1.draw()
        levels[2].goal.draw()
        love.graphics.print('jump', 180, 185)
    end

    levels[2].destroy = function()
        levels[2].player.body:destroy()
        levels[2].goal.body:destroy()
        levels[2].platform1.body:destroy()
    end

    return levels[2]
end
