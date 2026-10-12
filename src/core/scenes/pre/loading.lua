local screen = require("engine.screen")
local assets = require("engine.assets")
local ui = require("engine.ui")
local SceneManager = require("engine.scene_manager")
local args = require("src.core.system.args")


local loading = {}
local WAIT_FRAMES = 200
local timer = 0

function loading.load()
    timer = 0
    assets.load()
end

function loading.draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    ui.print_centered(locales.texts.loading, screen.pct_x(50), screen.pct_y(50))
end

function loading.update()
    timer = timer + 1
    if timer > WAIT_FRAMES then
        local next = args.target_scene or "main"
        args.target_scene = nil
        SceneManager.switch(next)
    end
end

return loading
