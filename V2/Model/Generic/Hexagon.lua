-- Model.Generic.Hexagon

local Hexagon = class()

local G_SQRT_3_2 = math.sqrt(3)/2

Hexagon.modes = enum("flat", "pointy")
Hexagon.default = {
    mode = Hexagon.modes.flat,
    size = 175,
    center = vec2(0,0),
    stroke = color(0, 0, 0, 255),
    strokeWidth = 2,
    fill = nil -- TODO (3 rect with rotation => not compatible with alpha) || 6 triangles
}

function Hexagon:init(args)
    if not args then args = {} end
    
    self.size = args.size or Hexagon.default.size
    self.center = args.center or Hexagon.default.center
    self._mode = args.mode or Hexagon.default.mode
    
    -- Style
    self.stroke = args.stroke or Hexagon.default.stroke
    self.strokeWidth = args.strokeWidth or Hexagon.default.strokeWidth
    
    self:update()
end

function Hexagon:update()
    self._img = self:_draw()
end

function Hexagon:mode(newMode)
    if not newMode then return self._mode end
    -- assert
    self._mode = newMode
    self:update()
end

function Hexagon:width()
    if self:mode() == Hexagon.modes.flat then
        return self.size * 2
    elseif self:mode() == Hexagon.modes.pointy then
        return G_SQRT_3_2 * self:height()
    end
end

function Hexagon:height()
    if self:mode() == Hexagon.modes.flat then
        return G_SQRT_3_2 * self:width()
    elseif self:mode() == Hexagon.modes.pointy then
        return self.size * 2
    end
end

function Hexagon:_draw()
    local width, height = self:width(), self:height()
    
    local img = image(width + self.strokeWidth, height + self.strokeWidth)
    setContext(img)
    translate(self.strokeWidth*.5, self.strokeWidth*.5)
    -- lineCapMode(SQUARE)
    stroke(self.stroke)
    strokeWidth(self.strokeWidth)
    
    local previous
    for i = 0,6 do
        local _i = i
        if self._mode == Hexagon.modes.pointy then _i = _i + .5 end
        local angle = _i * math.pi / 3
        local x_i = width/2 + self.size * math.cos(angle)
        local y_i = height/2 + self.size * math.sin(angle)
        if i ~= 0 then
            line(x_i, y_i, previous.x, previous.y)
        end
        previous = vec2(x_i, y_i)
    end
    
    setContext()
    
    return img
end

function Hexagon:draw()
    spriteMode(CENTER)
    sprite(self._img, self.center.x, self.center.y)
end

function Hexagon:touched(touch)
end

return Hexagon