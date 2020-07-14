------------------------------------------------
--                SCREEN (CANVAS)
-- the main screen where everything seen on the window
-- is drawn onto
------------------------------------------------

-- imports
local Canvas = require('utils.classes.graphics.canvas');
local Background = require('utils.classes.graphics.canvasses.background');
local Vector2 = require('utils.classes.math.vector2');

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