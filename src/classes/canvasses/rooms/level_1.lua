------------------------------------------------
--                LEVEL_1 (CANVAS)
-- the level 1 (entities get placed here)
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Background = require('classes.canvasses.background');
local Player = require('classes.entities.player');
local Fly = require('classes.entities.fly');
local Vector2 = require('classes.math.vector2');

local Level_1 = Canvas:derive("Level_1");

-- level constructor
function Level_1:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    -- timer
    self.timer = 0; -- timer
    self.timerlength = 60; -- how long the level is going for

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    self.background = Background();

    -- entities list (they are drawn to screen in the order they are added to the list)
    self.entities = {Fly(), Player()};

end

-- level update event
function Level_1:update(tick)
    -- update entities (go through entity list and update every single one)
    for i = 1, table.getn(self.entities), 1 do
        self.entities[i]:update(tick);
    end

    -- timer
    self.timer = self.timer + tick;
    if(self.timer > self.timerlength) then self:finished() end; -- levels done 
end

-- level draw event
function Level_1:draw()
    -- render to screen canvas
        self.canvas:renderTo(function()
            -- draw background
           self.background:draw();

           -- draw entities (go through entity list and draw every single one)
           for i = 1, table.getn(self.entities), 1 do
            self.entities[i]:draw();
           end

           -- TODO: FIGURE THE HUD STUFF OUT (+ the timer madness (put it in here or in hud clas IDK))

        end);

    -- draw screen scaled to window size
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end

-- mouse pressed event
function Level_1:mousepressed(x, y, button, istouch, presses)
    -- pass function to player and pass self (go through entities list and check for player entitiy and then pass it)
    for i = 1, table.getn(self.entities), 1 do
        if self.entities[i]:get_type() == "Player" then
            self.entities[i]:mousepressed(x, y, button, istouch, presses, self);
        end
    end
end

function Level_1:finished()
    -- TODO: when level 1 is finished (times up) 
end

return Level_1