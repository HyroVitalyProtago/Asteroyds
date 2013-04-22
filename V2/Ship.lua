Ship = class(Element)

function init(orientation)
	Element.init(self, true, Element.filters.SHIP_NO_COLLISION, orientation)

	local rotate = function(angle)
		self.orientation = self.orientation + angle
		if (self.orientation < 0) then
			self.orientation = self.orientation + 6
			--rotate(0)
		elseif (self.orientation > 6) then
			self.orientation = self.orientation % 6
		end
	end

end

function turnLeft()
	rotate(1)
end

function turnRight()
	rotate(-1)
end