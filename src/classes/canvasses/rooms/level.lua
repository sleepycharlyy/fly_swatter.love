-- TODO: decrease spawn interval 

------------------------------------------------
--                LEVEL_1 (CANVAS)
-- the level 1 (entities get placed here)
------------------------------------------------

-- imports
require('globals');
local Canvas = require('classes.canvas');
local Background = require('classes.canvasses.background');
local Vector2 = require('classes.math.vector2');
local Pause = require('classes.canvasses.pause');
local Player = require('classes.player');
local Fly = require('classes.entities.fly');

local Level = Canvas:derive("Level");

-- level constructor
function Level:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    -- background canvas
    self.background = Background();

    --timers and intervals
    self.timer_playtime = 0; -- time since start in sec
    self.interval_spawning = 0; -- when hit 0 new entities spawn
    self.interval_spawning_length = 3; -- current time in seconds till new entities spawn

    -- how many entities can be spawned max at a time (at the start 2)
    self.spawning_max = 2; 

    -- init player
    self.player = Player();

    -- entities list (they are drawn to screen in the order they are added to the list)
    self.entities = {};

    -- pause canvas
    self.pause = Pause();
end

-- level update event
function Level:update(delta_time)
    -- check if game is paused when no update
    if (PAUSED == false) then 

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

        -- calculate difficulty stuffs
            -- spawning_max calculation
            if(self.timer_playtime > 20) then -- if 10 seconds passed increse max spawning max
            -- using logarithm to increase spawning spawning_max i might change that later tho because i dont know much about math
            -- so idk if this is a good idea but it seemed good when i put the numbers through a calculator *shrug*
            self.spawning_max = math.floor(math.log(self.timer_playtime)) 
            end

        -- timer stuffs
            -- add delta_time every update function to playtime to calculate the time passed since playing
            self.timer_playtime = self.timer_playtime + delta_time;
            -- if interval_spawning is above 0 subtract delta_time
            if(self.interval_spawning > 0) then 
                self.interval_spawning = self.interval_spawning - delta_time; 
            end
            -- entity spawning
            -- if smaller or equal to 0 => restart timer and spawn random amount of entities
            if(self.interval_spawning <= 0) then 
                self.interval_spawning = self.interval_spawning_length;
                -- spawn: half of 'spawning_max' to 'spawning_max' flys
                for i = 1, math.random(math.floor(self.spawning_max/2), self.spawning_max), 1 do 
                    self.entities[#self.entities+1] = Fly();
                end
            end
    end
end

-- level draw event
function Level:draw()
    -- render to screen canvas
        self.canvas:renderTo(function()
            -- draw background
           self.background:draw();

           -- draw entities (go through entity list and draw every single one)
           for i = 1, #self.entities, 1 do
            self.entities[i]:draw();
           end

           -- draw player
           self.player:draw();

           -- TODO: prettier HUD
           -- hud
           love.graphics.print("SCORE= "..CURRENT_SCORE, 0, 0) -- print current score
           love.graphics.print("HS= "..HIGH_SCORE, 128, 0) -- print high score


           -- check if game paused when yes print pause menu
           if (PAUSE == true) then
                self.pause:draw();
           end
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