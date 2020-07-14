------------------------------------------------
--                SCREEN (CANVAS)
-- the main screen where everything seen on the window
-- is drawn onto
------------------------------------------------

-- imports
require('globals');
local Canvas = require('classes.canvas');
local Background = require('classes.canvasses.background');
local Vector2 = require('classes.math.vector2');

local Screen = Canvas:derive("Screen");

-- screen constructor
function Screen:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    self.background = Background();
end

-- screen draw event
function Screen:draw()
    -- render to screen canvas
        self.canvas:renderTo(function()
            -- draw background
           self.background:draw();
        end);

    -- draw screen scaled to window size
    love.graphics.draw(self.canvas, self.position.x, self.position.y, 0, love.graphics.getWidth()/WIDTH, love.graphics.getHeight()/HEIGHT);
end

return Screen