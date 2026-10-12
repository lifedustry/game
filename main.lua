local SceneManager = require("engine.scene_manager")
local assets = require("engine.assets")
local dev = require("src.core.system.dev")
local screen = require("engine.screen")
local gui = require("engine.gui")
local args = require("src.core.system.args")
local locales = require("engine.locales")

---@type boolean
_G.DEV = false -- set devmode by default ex for android if u want dev mode enable here

function love.load(arg)
    args.start(arg)
    if DEV then dev.load() end
    locales.load(args.lang or locales.lang)
    assets.preload()
    SceneManager.load()
end

function love.update(dt)
    SceneManager.update(dt)
    screen.update()
    if DEV then dev.keycheck() end
end

function love.draw()
    SceneManager.draw()
    if DEV then dev.info() end
end
