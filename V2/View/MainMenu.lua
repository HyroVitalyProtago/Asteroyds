-- View.MainMenu

local MainMenu = {}

MainMenu.lang = {
	current = "en",
	["New Game"] = {
		en = "New Game",
		fr = "Nouvelle Partie"
	},
	["Rules"] = {
		en = "Rules",
		fr = "Règles"
	},
	["Settings"] = {
		en = "Settings",
		fr = "Paramètres"
	},
}

MainMenu.items = {
	"New Game",
	"Rules",
	"Settings"
}

MainMenu.drawItem = function(item, x, y)
	-- font("Optima-Bold")
	font("Copperplate-Light")

	fill(0,0,255)
	fontSize(64)

	text(MainMenu.lang[item][MainMenu.lang.current], x - 1, y)
	text(MainMenu.lang[item][MainMenu.lang.current], x + 1, y)
	text(MainMenu.lang[item][MainMenu.lang.current], x, y + 1)
	text(MainMenu.lang[item][MainMenu.lang.current], x, y - 1)

	fill(0,0,100)
	fontSize(64)
	text(MainMenu.lang[item][MainMenu.lang.current], x, y)
end

MainMenu.draw = function()
	sprite("Documents:Background", WIDTH/2, HEIGHT/2, WIDTH, HEIGHT)

	for i,item in ipairs(MainMenu.items) do
		MainMenu.drawItem(item, WIDTH/2, (#MainMenu.items - i + 1)*HEIGHT/(#MainMenu.items + 1))
	end
	-- New Game
		-- nb players (1-6)
			-- profils
	-- Profils
	-- Classement

	-- Rules
	-- Settings
	-- Credits

	-- + New Ship
	-- + Achievement

end

return MainMenu