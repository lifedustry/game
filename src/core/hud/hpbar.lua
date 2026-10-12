local player = require("src.core.player")
local screen = require("engine.screen")
local ui = require("engine.ui")
local hpbar = {}


function hpbar.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", screen.pct_x(50) - 150, screen.height - 120, (player.hp / player.maxhp) * 300, 25, 10)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("line", screen.pct_x(50) - 150, screen.height - 120, 300, 25, 10, 10, 10)
    love.graphics.setColor(1, 1, 1)
    ui.print_centered("HP : " .. player.hp .. "/" .. player.maxhp, screen.pct_x(50), screen.height - 109)
end

return hpbar