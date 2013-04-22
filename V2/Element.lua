Element = class()

Element.filters = {SHIP_COLLISION=0, SHIP_NO_COLLISION=1}
Element.orientations = {EST=0, NORD_EST=1, NORD_OUEST=2, OUEST=3, SUD_OUEST=4, SUD_EST=5}

function Element:init(isShip, filter, orientation)

	assert(filter < 1 or filter > #Element.filters, "Element: filter invalid")
	assert(orientation < 1 or orientation > #Element.orientations, "Element: orientation invalid")

	self.isShip = isShip
	self.filter = filter
	self.orientation = orientation

end

function Element:draw() end