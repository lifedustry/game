local screen = require("engine.screen")
local ui = require("engine.ui")
local gui = require("engine.gui")
local SceneManager = require("engine.scene_manager")
local assets = require("engine.assets")

local gameover = {}

function gameover.load()
	gui.reset()
	gui.add({type = "button",
			text = locales.texts.respawn,
			w = 230,
			h = 35,
			x = 25, 
			y = 90,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() SceneManager.switch("game") end
		})
	gui.add({type = "button",
			text = locales.texts.quit,
			w = 230,
			h = 35,
			x = 75, 
			y = 90,
			width = 230,
			height = 35,
			hover = 1.30,
			callback = function() SceneManager.switch("main") end
		})
	gameover.rotation = 0
end

function gameover.draw()
	gui.draw()
	ui.print_centered(locales.texts.game_over, screen.pct_x(50), screen.pct_y(15))	
	love.graphics.draw(assets.textures.ui.annoying_cat, screen.pct_x(50), screen.pct_y(50), gameover.rotation, 0.2, 0.2, assets.textures.ui.annoying_cat:getWidth()/2, assets.textures.ui.annoying_cat:getHeight()/2)
end

function gameover.update(dt)
	gui.update(dt) 
	gameover.rotation = gameover.rotation + 3 * dt
end

return gameover
