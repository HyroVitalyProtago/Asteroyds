-- Asteroyds :: Main

package.path = os.getenv('HOME') .. '/Documents/Asteroyds.codea/?.lua'
local __require = require
require = function(path) return __require(path:gsub('%.', '/')) end

displayMode(FULLSCREEN)

function setup() end

function draw() end

function touched(touch) end

function keyboard(key) end

function orientationChanged(newOrientation) end
