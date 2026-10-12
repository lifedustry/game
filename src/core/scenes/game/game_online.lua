local assets = require("engine.assets")
local player = require("src.core.player")
local mobs = require("engine.mobs")
local camera = require("src.core.camera")
local screen = require("engine.screen")
local hud = require("src.core.hud.hud")
local gui = require("engine.gui")
local event = require("src.core.event")
local time = require("src.core.time")
local client = require("src.core.multiplayer.client")
local map = require("src.core.map")
local game = {}

function game.load()
    client.host_ip = gui.get("ip", "text")
    client.local_username = gui.get("username", "text")
	client.connect()
    map.seed = nil
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
    client.update()
	if _G.DEV and love.keyboard.isDown("t") then game.timeStop = not game.timeStop end
    if not game.timeStop then mobs.update(dt) end
    time.update(dt)
    event.update(dt)
	player.update(dt)
	if map.seed then
        camera.update(dt)
    end
    hud.update(dt)
end

function love.keypressed(key, scancode)
    if key == "f11" then
        screen.fullscreen = not screen.fullscreen
        love.window.setFullscreen(screen.fullscreen)
    end
end
return game
