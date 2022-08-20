function spawnLevel3()
    levels[3] = {}
    levels[3].player = spawnPlayer(15, 230)
    levels[3].goal = spawnGoal(385, 225)
    levels[3].spike1 = spawnSpike(192, 224, 0, 0, 4, 16, -4, 16)
    levels[3].spike2 = spawnSpike(200, 224, 0, 0, 4, 16, -4, 16)
    levels[3].spike3 = spawnSpike(208, 224, 0, 0, 4, 16, -4, 16)

    levels[3].draw = function()
        levels[3].player.draw()
        levels[3].spike1.draw()
        levels[3].spike2.draw()
        levels[3].spike3.draw()
        levels[3].goal.draw()
        love.graphics.print('spikes = bad', 165, 205)
    end

    levels[3].destroy = function()
        levels[3].player.body:destroy()
        levels[3].spike1.body:destroy()
        levels[3].spike2.body:destroy()
        levels[3].spike3.body:destroy()
        levels[3].goal.body:destroy()
    end

    return levels[3]
end
