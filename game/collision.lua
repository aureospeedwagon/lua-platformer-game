function onCollision(a, b, coll)
    if (a:getUserData()[1]=="character" and b:getUserData()[1]=="goal") 
        or (b:getUserData()[1]=="character" and a:getUserData()[1]=="goal")
    then
        hitgoal = true
    end

    if (a:getUserData()[1]=="character" and b:getUserData()[1]=="enemy") 
        or (b:getUserData()[1]=="character" and a:getUserData()[1]=="enemy")
    then
        hitenemy = true
    end
end