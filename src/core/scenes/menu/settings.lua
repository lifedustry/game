local screen = require("engine.screen")
local ui = require("engine.ui")
local gui = require("engine.gui")
local util = require("engine.util")
local SceneManager = require("engine.scene_manager")
local assets = require("engine.assets")

local settings = {}

function settings.load() 
	gui.reset()
gui.add({type = "button",
			id = "fullscreen",
			text = screen.fullscreen,
			w = 250,
			h = 35,
			x = 50, 
			y = 50,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() love.window.setFullscreen(not screen.fullscreen) end
		})
gui.add({type = "button",
			id = "vsync",
			text = screen.vsync,
			w = 250,
			h = 35,
			x = 50, 
			y = 60,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() love.window.setVSync(screen.vsync == 1 and 0 or 1) end
		})
gui.add({type = "input",
			id = "lang",
			text = locales.lang,
			w = 250,
			h = 35,
			x = 50, 
			y = 70,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() locales.load(gui.get("lang", "text")) end
		})
end

function settings.draw()
	love.graphics.draw(assets.textures.bg, 0, 0, 0, screen.width/640, screen.height/480)

	ui.print_centered(locales.texts.settings, screen.pct_x(50), screen.pct_y(15))
	ui.print_centered(locales.texts.Press_Escape_to_go_back, screen.pct_x(50), screen.pct_y(20))
	ui.print_centered(
		(locales.texts.resolution .. ": %dx%d"):format(screen.width, screen.height),
		screen.pct_x(50),
		screen.pct_y(80)
	)
	gui.draw()
end

function settings.update(dt)
	gui.update(dt)
	gui.edit("vsync", "text", (locales.texts.vsync .. ": %s"):format(util.bool_to_string(screen.vsync)))
	gui.edit("fullscreen", "text", (locales.texts.fullscreen .. ": %s"):format(util.bool_to_string(screen.fullscreen)))

	if love.keyboard.isDown("escape") then
		gui.reset()
		SceneManager.switch("main")
	end
end

return settings
