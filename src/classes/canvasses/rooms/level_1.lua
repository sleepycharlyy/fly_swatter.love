------------------------------------------------
--                LEVEL_1 (CANVAS)
-- the level 1 (entities get placed here)
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Background = require('classes.canvasses.background');
local Player = require('classes.entities.player');
local Vector2 = require('classes.math.vector2');

local Level_1 = Canvas:derive("Level_1");

-- level constructor
function Level_1:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    self.background = Background();

    -- entities 
    self.player = Player();
end

-- level update event
function Level_1:update(tick)
    -- entities
    self.player:update(tick);
end

-- level draw event
function Level_1:draw()
    -- render to screen canvas
        self.canvas:renderTo(function()
            -- draw background
           self.background:draw();

           -- draw entities
           self.player:draw();
        end);

    -- draw screen scaled to window size
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end

return Level_1