-- TODO: make class

------------------------------------------------
--             PAUSE_MENU (CANVAS)
-- pause menu screen
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

local Pause_Menu = Canvas:derive("Pause_Menu");

-- pausemenu constructor
function Pause_Menu:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);
  
    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- pausemenu draw event
function Pause_Menu:draw()
    -- render pausemenu screen
    self.canvas:renderTo(function ()
    end);

    -- draw pausemenu
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Pause_Menu