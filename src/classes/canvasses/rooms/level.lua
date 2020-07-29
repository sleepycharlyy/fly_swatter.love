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

local Level = Canvas:derive("Level");

-- level constructor
function Level:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    self.background = Background();

    -- entities list (they are drawn to screen in the order they are added to the list)
    self.entities = {Fly(), Player()};

end

-- level update event
function Level:update(tick)
    -- update entities (go through entity list and update every single one)
    for i = 1, table.getn(self.entities), 1 do
        self.entities[i]:update(tick);
    end
end

-- level draw event
function Level:draw()
    -- render to screen canvas
        self.canvas:renderTo(function()
            -- draw background
           self.background:draw();

           -- draw entities (go through entity list and draw every single one)
           for i = 1, table.getn(self.entities), 1 do
            self.entities[i]:draw();
           end

           -- TODO: prettier HUD
           -- hud
           love.graphics.print("SCORE= "..CURRENT_SCORE, 0, 0) -- print current score
           love.graphics.print("HS= "..HIGH_SCORE, 128, 0) -- print high score
        end);

    -- draw screen scaled to window size
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end

-- mouse pressed event
function Level:mousepressed(x, y, button, istouch, presses)
    -- pass function to player and pass self (go through entities list and check for player entitiy and then pass it)
    for i = 1, table.getn(self.entities), 1 do
        if self.entities[i]:get_type() == "Player" then
            self.entities[i]:mousepressed(x, y, button, istouch, presses, self);
        end
    end
end

return Level