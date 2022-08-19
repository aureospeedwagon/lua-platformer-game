function loadWalls()

    wallbodies = love.physics.newBody(world, 0, 0, "static") -- WALLS

    leftWallShape = love.physics.newPolygonShape(-1, -1, 1, -1, 1, 241, -1, 241)
    leftWallFixture = love.physics.newFixture(wallbodies, leftWallShape)
    leftWallFixture:setUserData({"left"})
    leftWallFixture:setFriction(0)
    leftWall = {}
    leftWall.body = wallBodies
    leftWall.fixture = leftWallFixture
    leftWall.shape = leftWallShape
    leftWall.draw = function()
        love.graphics.polygon("fill", -1, -1, 1, -1, 1, 241, -1, 241)
    end

    rightWallShape = love.physics.newPolygonShape(399, -1, 401, -1, 401, 241, 399, 241)
    rightWallFixture = love.physics.newFixture(wallbodies, rightWallShape)
    rightWallFixture:setUserData({"right"})
    rightWallFixture:setFriction(0)
    rightWall = {}
    rightWall.body = wallBodies
    rightWall.fixture = rightWallFixture
    rightWall.shape = rightWallShape
    rightWall.draw = function()
        love.graphics.polygon("fill", 399, -1, 401, -1, 401, 241, 399, 241)
    end

    bottomWallShape = love.physics.newPolygonShape(-1, 239, 401, 239, 401, 241, -1, 241)
    bottomWallFixture = love.physics.newFixture(wallbodies, bottomWallShape)
    bottomWallFixture:setUserData({"bottom"})
    bottomWallFixture:setFriction(0)
    bottomWall = {}
    bottomWall.body = wallBodies
    bottomWall.fixture = bottomWallFixture
    bottomWall.shape = bottomWallShape
    bottomWall.draw = function()
        love.graphics.polygon("fill", -1, 239, 401, 239, 401, 241, -1, 241)
    end

    topWallShape = love.physics.newPolygonShape(-1, -1, 401, -1, 401, 1, -1, 1)
    topWallFixture = love.physics.newFixture(wallbodies, topWallShape)
    topWallFixture:setUserData({"top"})
    topWallFixture:setFriction(0)
    topWall = {}
    topWall.body = wallBodies
    topWall.fixture = topWallFixture
    topWall.shape = topWallShape
    topWall.draw = function()
        love.graphics.polygon("fill", -1, -1, 401, -1, 401, 1, -1, 1)
    end

    walls = {}
    walls.left = leftWall
    walls.right = rightWall
    walls.bottom = bottomWall
    walls.top = topWall
    walls.draw = function()
        leftWall.draw()
        rightWall.draw()
        topWall.draw()
        bottomWall.draw()
    end

end
