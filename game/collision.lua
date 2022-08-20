function onCollision(a, b, coll)

    if (a:getUserData()[1] == "player" and b:getUserData()[1] == "goal") or
        (b:getUserData()[1] == "player" and a:getUserData()[1] == "goal") then
        hitgoal = true
    end

    if (a:getUserData()[1] == "player" and b:getUserData()[1] == "enemy") or
        (b:getUserData()[1] == "player" and a:getUserData()[1] == "enemy") then
        hitenemy = true
    end

    if (a:getUserData()[1] == "player" and b:getUserData()[1] == "collectable") or
        (b:getUserData()[1] == "player" and a:getUserData()[1] == "collectable") then
        local collectable

        if a:getUserData()[1] == "collectable" then
            collectable = a
        else
            collectable = b
        end

        hitCollectable = collectable

    end

end
