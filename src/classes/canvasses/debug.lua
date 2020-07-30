------------------------------------------------
--             DEBUG (CANVAS)
-- this is the debug overlay
------------------------------------------------

-- imports
require('globals');
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

local Debug = Canvas:derive("Debug");

-- background constructor
function Debug:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- background draw event
function Debug:draw()
    -- render background
    self.canvas:renderTo(function ()
        -- debug overlay
        love.graphics.setColor(1,0,0); -- color red
        love.graphics.print("FPS: "..love.timer.getFPS(), 0, HEIGHT-32); -- draw fps
        love.graphics.print("Current Room: "..CURRENT_ROOM, 0, HEIGHT-16); -- draw current room
        love.graphics.setColor(1,1,1); -- color reset
    end);

    -- draw background
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Debug