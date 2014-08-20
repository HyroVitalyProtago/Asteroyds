-- Model.Ship

local Element = require "Model.Element"

local Ship = class(Element)

function Ship:init(orientation)
	Element.init(self, true, Element.filters.SHIP_NO_COLLISION, orientation)
end

function Ship:turnLeft()
	self:rotate(1)
end

function Ship:turnRight()
	self:rotate(-1)
end

function Ship:turnBack()
	self:rotate(3)
end

function Ship:rotate(angle)
	self.orientation = self.orientation + angle
	if (self.orientation < 0) then
		self.orientation = self.orientation + 6
	elseif (self.orientation >= 6) then
		self.orientation = self.orientation % 6
	end
end

function Ship:draw()
	pushMatrix()

	--translate()
	--rotate()
	--sprite()

	popMatrix()
end

return Ship