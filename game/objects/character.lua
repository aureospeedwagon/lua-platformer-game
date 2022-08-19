function spawnCharacter(x, y)
    character = {}

    characterbody = love.physics.newBody(world, x, y, "dynamic", 5, 0) -- WALLS
    charactershape = love.physics.newPolygonShape(0, 0, 0, 7, 7, 7, 7, 0)
    characterfixture = love.physics.newFixture(characterbody, charactershape)
    characterfixture:setUserData({'character'})

    character.body = characterbody
    character.shape = charactershape
    character.fixture = characterfixture
    character.draw = function()
        love.graphics.polygon("fill", character.body:getX(), character.body:getY(), character.body:getWorldPoints(character.shape:getPoints()))
    end

    return character
end