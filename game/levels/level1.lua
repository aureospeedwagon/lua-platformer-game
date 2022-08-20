function spawnLevel1()
    levels[1] = {}
    levels[1].player = spawnPlayer(15, 230)
    levels[1].goal = spawnGoal(385, 225)
    
    levels[1].draw = function()
        levels[1].player.draw()
        levels[1].goal.draw()
    end

    levels[1].destroy = function()
        levels[1].player.body:destroy()
        levels[1].goal.body:destroy()
    end

    
    return levels[1]
end