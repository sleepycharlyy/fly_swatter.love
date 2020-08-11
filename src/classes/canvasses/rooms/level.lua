-- TODO: 2 timers.. one for playtime and one for fly spawning intervals
-- Spawning system.. every idk 'spawning_interval' (maybe 2 seconds at starts) a random amount between 1-playtime/(sum number) flies spawn

------------------------------------------------
--                LEVEL_1 (CANVAS)
-- the level 1 (entities get placed here)
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Background = require('classes.canvasses.background');
local Vector2 = require('classes.math.vector2');
local Player = require('classes.player');
local Fly = require('classes.entities.fly');

local Level = Canvas:derive("Level");

-- level constructor
function Level:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    self.background = Background();

    -- init player
    self.player = Player();

    -- entities list (they are drawn to screen in the order they are added to the list)
    self.entities = {Fly(), Fly(), Fly()};

end

-- level update event
function Level:update(delta_time)
    -- update entities (go through entity list and update every single one)
    for i = #self.entities, 1, -1 do
        -- update entities
        self.entities[i]:update(delta_time);
        -- check for deactivated entities
        if(self.entities[i].state == 0) then
            table.remove(self.entities, i)
        end
    end

    -- update player
    self.player:update(delta_time);
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

           -- draw player
           self.player:draw();

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
    -- pass function to player and pass self 
    self.player:mousepressed(x, y, button, istouch, presses, self);
end

return Level