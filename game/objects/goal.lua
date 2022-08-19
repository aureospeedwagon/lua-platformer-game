function spawnGoal(x, y)
    goal = {}

    goalBody = love.physics.newBody(world, x, y, "static")
    goalShape = love.physics.newPolygonShape(0, 0, 0, 15, 15, 15, 15, 0)
    goalFixture = love.physics.newFixture(goalBody, goalShape)
    goalFixture:setUserData({'goal'})

    goal.body = goalBody
    goal.shape = goalShape
    goal.fixture = goalFixture
    goal.draw = function()
        love.graphics.print('GOAL', goal.body:getX() - 20, goal.body:getY() - 20)
        love.graphics.polygon("fill", goal.body:getX(), goal.body:getY(), goal.body:getWorldPoints(goal.shape:getPoints()))
    end

    return goal

end
