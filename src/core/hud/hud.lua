local hotbar = require("src.core.hud.hotbar")
local hpbar = require("src.core.hud.hpbar")

local hud = {}

function hud.draw()
    hotbar.draw()
    hpbar.draw()
end

function hud.update(dt)
    hotbar.update(dt)
end

return hud
