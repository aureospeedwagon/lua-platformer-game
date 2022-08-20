function spawnLevel4()
    levels[4] = {}
    levels[4].player = spawnPlayer(15, 230)
    levels[4].goal = spawnGoal(385, 225)
    levels[4].coin1 = spawnCoin(185, 200, 5, 1)
    levels[4].coin2 = spawnCoin(200, 200, 5, 1)
    levels[4].coin3 = spawnCoin(215, 200, 5, 1)

    levels[4].draw = function()
        levels[4].player.draw()
        levels[4].coin1.draw()
        levels[4].coin2.draw()
        levels[4].coin3.draw()
        levels[4].goal.draw()
        love.graphics.print('coins = good', 170, 180)
    end

    levels[4].destroy = function()
        levels[4].player.body:destroy()
        levels[4].coin1.body:destroy()
        levels[4].coin2.body:destroy()
        levels[4].coin3.body:destroy()
        levels[4].goal.body:destroy()
    end

    return levels[4]
end
