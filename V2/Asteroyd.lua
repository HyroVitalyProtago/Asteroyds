Asteroyd = class(Element)

Asteroyd.types = {RED=1, WHITE=2, BLUE=3, WHITE_RED=4, WHITE_BLUE=5, DOOR_WHITE=6, DOOR_RED=7, POD=8, PLATFORM=9}

function Asteroyd:init(type, priority, orientation)

	assert(type < 1 or type > #Asteroyd.types, "Asteroyd: type invalid")

	filter = Element.filters.SHIP_COLLISION
	if (type >= Asteroyd.types.POD and type <= Asteroyd.types.PLATFORM) then
		filter = Element.filters.SHIP_NO_COLLISION
	end
	
	Element.init(self, false, filter, orientation)

	self.type = type
	self.priority = priority

end