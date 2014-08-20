-- Model.Generic.Grid

local Grid = class()

local Hexagon = require "Model.Generic.Hexagon"

Grid.modes = {
    offset = enum("oddR", "evenR", "oddQ", "evenQ"),
    cube = "cube",
    axial = "axial"
}
Grid.neighbors = {
    pointy = {
        EST = vec3(1,-1,0),
        NORD_EST = vec3(1,0,-1),
        NORD_OUEST = vec3(0,1,-1),
        OUEST = vec3(-1,1,0),
        SUD_OUEST = vec3(-1,0,1),
        SUD_EST = vec3(0,-1,1)
        -- diagonals
    }
}
Grid.default = {
    mode = Grid.modes.axial,
    coordinates = true
}

function Grid:init(hex,grid)
    self.hex = hex
    self.grid = grid
    self.mode = Grid.default.mode
    self.coordinates = Grid.default.coordinates
    self.objects = {}

    -- tests
    self.objects["4, 5"] = {
        draw = function(w)
            sprite(readImage("Space Art:Asteroid Large"), 0, 0, .75 * w)
        end
    }
end

function Grid:width()
    return #self.grid[1] * self.hex:width() -- todo
end

function Grid:height()
    return (#self.grid - 4) * self.hex:height() -- todo
end

function Grid:draw()
    local row, column, r, q
    
    translate(-self:width()/2, -self:height()/2)
    for row = 1, #self.grid do
        for column = 1, #self.grid[row] do
            
            r = #self.grid - row
            q = column - 1
            
            pushMatrix()
            if self.hex:mode() == Hexagon.modes.flat then -- to test
                if row % 2 == 1 then
                    translate(self.hex:width()*.5, 0)
                else
                    translate(self.hex:width()*1.25, 0)
                end
                translate(q*self.hex:width()*1.5, r*self.hex:height()*.5)
            else -- pointy
                if row % 2 == 1 then
                    translate(self.hex:width()*.5, 0)
                else
                    translate(self.hex:width(), 0)
                end
                translate(q*self.hex:width(), r*self.hex:height()*.75)
            end
            if self.grid[row][column] == 0 then
                self.hex:draw()
                local c = oddR_to_cube(axial(column - 1, row - 1))
                local txt = ""
                if self.mode == Grid.modes.cube then
                    txt = c.x .. ", " .. c.y .. ", " .. c.z
                elseif self.mode == Grid.modes.axial then
                    c = cube_to_axial(c)
                    txt = c.q .. ", " .. c.r
                end
                if self.coordinates then
                    text(txt)
                end
                if self.objects[txt] ~= nil then
                    -- sprite(self.objects[txt], 0, 0, .75 * self.hex:width())
                    self.objects[txt].draw(self.hex:width())
                end
            end
            popMatrix()
        end
    end
end

-- type of vec2
function axial(q,r)
    return {
        q = q, -- column
        r = r -- row
    }
end

-- # convert cube to axial
function cube_to_axial(c)
    return axial(c.x,c.z)
end

-- # convert axial to cube
function axial_to_cube(c)
    local x,z,y
    x = c.q
    z = c.r
    y = -x-z
    return vec3(x,y,z)
end

-- # convert cube to even-q offset
function cube_to_evenQ(c)
    return axial(c.x, c.z + (c.x + (c.x % 2)) / 2)
end

-- # convert even-q offset to cube
function evenQ_to_cube(c)
    local x,z,y
    x = c.q
    z = c.r - (c.q + (c.q % 2)) / 2
    y = -x-z
    return vec3(x,y,z)
end

-- # convert cube to odd-q offset
function cube_to_oddQ(c)
    return axial(c.x, c.z + (c.x - (c.x % 2)) / 2)
end

-- # convert odd-q offset to cube
function oddQ_to_cube(c)
    local x,z,y
    x = c.q
    z = c.r - (c.q - (c.q % 2)) / 2
    y = -x-z
    return vec3(x,y,z)
end

-- # convert cube to even-r offset
function cube_to_evenR(c)
    return axial(c.x + (c.z - (c.z % 2)) / 2, c.z)
end

-- # convert even-r offset to cube
function evenR_to_cube(c)
    local x,z,y
    x = c.q - (c.r + (c.r % 2)) / 2
    z = c.r
    y = -x-z
    return vec3(x,y,z)
end

-- # convert cube to odd-r offset
function cube_to_oddR(c)
    return axial(c.x + (c.z - (c.z % 2)) / 2, c.z)
end

-- # convert odd-r offset to cube
function oddR_to_cube(c)
    local x,y,z
    x = c.q - (c.r - (c.r % 2)) / 2
    z = c.r
    y = -x-z
    return vec3(x,y,z)
end

function Grid:get_neighbor(pos,dir) -- dir : int
    local p
    if self.mode == grid.mode.axial then
        p = axial_to_cube(pos)
        p = p + Grid.neighbors[self.hex:mode()][dir]
        return cube_to_axial(p)
    end
end

function Grid:touched(touch)
end

return Grid