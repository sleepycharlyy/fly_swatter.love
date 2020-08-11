-- TODO: make class

------------------------------------------------
--             Pause (CANVAS)
-- pause menu screen
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

local Pause = Canvas:derive("Pause");

-- pause menu constructor
function Pause:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);
  
    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- pausemenu draw event
function Pause:draw()
    -- render pause menu screen
    self.canvas:renderTo(function ()
    end);

    -- draw pause menu
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Pause