function spawnLevel(n)
    if     n == 1 then return spawnLevel1
    elseif n == 2 then return spawnLevel2
    elseif n == 3 then return spawnLevel3
    elseif n == 4 then return spawnLevel4
    elseif n == 5 then return spawnLevel5
    end
    return nil
end
