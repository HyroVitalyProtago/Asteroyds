Plateau = class()

local LI = 13
local CO = 16

-- movements table declared at the end of file

local _plateau = { {1,1,1,0,0,0,0,1,1,0,0,0,0,1,1,1},
                    {1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
                   {1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
                      {1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
                   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                   {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                    {1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
                   {1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1},
                    {1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
                   {1,1,1,0,0,0,0,1,1,0,0,0,0,1,1,1} }

function Plateau:init()
    -- Ships
    self.ships = {}
    -- Asteroyds
    self.asteroyds = {}

    -- Doors
    --self.doors = {}

    local getIndiceInLookupTableOf = function(n)
        for i,v in ipairs(asteroydsLookupTable) do
            if v == n then
                return i
            end
        end
        --return -1
    end

    -- no more table or change code of getPosition and getObj
end

function Plateau:addShip(li, co, ship)
    local pos = {}
    pos.li = li
    pos.co = co

    if (not self:contain(li,co) or self.asteroyds[pos] ~= nil) then
        -- assert() ?
        return false
    end

    self.ships[pos] = ship
    return true
end
function Plateau:addAsteroyd(li, co, asteroyd)
    local pos = {}
    pos.li = li
    pos.co = co

    if (not self:contain(li,co) or self.ships[pos] ~= nil or self.asteroyds[pos] ~= nil) then
        return false
    end

    self.asteroyds[pos] = asteroyd
    return true
end

function Plateau:getPosition(obj)
    for k,v in pairs(self) do -- (ships, asteroyds, doors)
        if type(v) == "table" then -- useless if plateau have no more attribut
            for k2,v2 in pairs(v) do
                if (v2 == obj) then
                    return k2.li, k2.co
                end
            end
        end
    end
    return nil
end

function Plateau:getObj(li, co)
    for k,v in pairs(self) do -- (ships, asteroyds, doors)
        if type(v) == "table" then -- useless if plateau have no more attribut
            for k2,v2 in pairs(v) do
                if (k2.li == li and k2.co == co) then
                    return v2
                end
            end
        end
    end
    return nil
end

function Plateau:getObj(tab, li, co)
    for k,v in pairs(tab) do
        if (k.li == li and k.co == co) then
            return v
        end
    end
    return nil
end

-- Ship orientation : 0 est, 1 nordEst, ..., 6 sudEst
function Plateau:moveShip(ship)
    local pos = {}
    pos.li, pos.co = movements[ship.orientation](self:getPosition(ship))
    if self:contain(pos.li, pos.co) and self.asteroyds[pos] == nil then
        return true
    end
    return false
end

-- Doors is an asteroyds
function Plateau:moveAsteroyd(asteroyd, des)
    local pos = {}

    local indice = self:getIndiceInLookupTableOf(des)
    indice = indice + (asteroyd.orientation - 1)
    if (indice > 6) then indice = (indice%7)+1 end
    indice = asteroydsLookupTable[indice]

    pos.li, pos.co = movements[indice](self:getPosition(asteroyd))
    if self:contain(pos.li, pos.co) and self.ships[pos] == nil then
        return true
    end
    return false
end

--[[
function Plateau:getIndiceInLookupTableOf(n)
    for i,v in ipairs(asteroydsLookupTable) do
        if v == n then
            return i
        end
    end
    --return -1
end
]]--

-- VIEW
function Plateau:draw(pw, ph)

    local size = #_plateau
    local w = pw/16.5
    local h = ph/10

    for li=1,#_plateau do
        for co=1,#_plateau[li] do
            if _plateau[li][co] == 0 then
            pushMatrix()

            local x,y

            -- Mode Center
            if li % 2 == 1 then
                x = w/2 + ((co-1)*w)
            else
                x = co * w
            end

            y = h/2 + ((li-1)*h/1)

            translate(x, y)

            sprite("Documents:hexagone", 0, 0, w, h)

            -- content
            local asteroyd = self:getObj(self.asteroyds, li, co)
            if asteroyd then asteroyd:draw() end
            local ship = self:getObj(self.ships, li, co)
            if ship then ship:draw() end

            popMatrix()
            end
        end
    end

end

-- UTILS
function Plateau:contain(li, co)
    return li >= 1 and li <= LI and co >= 1 and co <= CO and _plateau[li][co] == 0
end
function Plateau.getNordOuest(li, co)
    if (li % 2 == 1) then
        return li - 1, co - 1
    else
        return li - 1, co
    end
end
function Plateau.getOuest(li, co)
    if (li % 2 == 1) then
        return li, co - 1
    else
        return li, co - 1
    end
end
function Plateau.getSudOuest(li, co)
    if (li % 2 == 1) then
        return li + 1, co - 1
    else
        return li + 1, co
    end
end
function Plateau.getSudEst(li, co)
    if (li % 2 == 1) then
        return li + 1, co
    else
        return li + 1, co + 1
    end
end
function Plateau.getEst(li, co)
    if (li % 2 == 1) then
        return li, co + 1
    else
        return li, co + 1
    end
end
function Plateau.getNordEst(li, co)
    if (li % 2 == 1) then
        return li - 1, co
    else
        return li - 1, co + 1
    end
end

local movements = {Plateau.getOuest, Plateau.getNordOuest, Plateau.getNordEst, 
                    Plateau.getEst, Plateau.getSudEst, Plateau.getSudOuest}
local asteroydsLookupTable = {1,4,2,6,3,5}
