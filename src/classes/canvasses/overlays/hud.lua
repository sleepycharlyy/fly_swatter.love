-- TODO: make class

------------------------------------------------
--                 HUD (CANVAS)
-- hud overlay
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

local HUD = Canvas:derive("HUD");

-- gameover constructor
function HUD:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);
    
    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- gameover draw event
function HUD:draw()
    -- render hud screen
    self.canvas:renderTo(function ()
    end);

    -- draw hud
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return HUD