local assets = require("engine.assets")
local player = require("src.core.player")
local mobs = require("engine.mobs")
local camera = require("src.core.camera")
local screen = require("engine.screen")
local hud = require("src.core.hud.hud")
local gui = require("engine.gui")
local event = require("src.core.event")
local time = require("src.core.time")

local game = {}

function game.load()
    gui.reset()
    game.timeStop = false
	assets.audios.music.menu:stop()
end

function game.draw()
	camera.draw()
    hud.draw()
    event.draw()
end

function game.update(dt)
	if _G.DEV and love.keyboard.isDown("t") then game.timeStop = not game.timeStop end
    if not game.timeStop then mobs.update(dt) end
    time.update(dt)
    event.update(dt)
	player.update(dt)
	camera.update(dt)
    hud.update(dt)
end

function love.keypressed(key, scancode)
    if key == "f11" then
        screen.fullscreen = not screen.fullscreen
        love.window.setFullscreen(screen.fullscreen)
    end
end
return game
