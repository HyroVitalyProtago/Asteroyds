Ship = class(Element)

function Ship:init(orientation)
	Element.init(self, true, Element.filters.SHIP_NO_COLLISION, orientation)
end

function Ship:turnLeft()
	rotate(1)
end

function Ship:turnRight()
	rotate(-1)
end

function Ship:turnBack()
	rotate(3)
end

function Ship:rotate(angle)
	self.orientation = self.orientation + angle
	if (self.orientation < 0) then
		self.orientation = self.orientation + 6
		--rotate(0)
	elseif (self.orientation > 6) then
		self.orientation = self.orientation % 6
	end
end

function Ship:draw()
	pushMatrix()

	--rotate()
	--translate()
	--sprite()

	popMatrix()
end