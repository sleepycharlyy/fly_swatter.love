-- TODO: make class

------------------------------------------------
--             GAME_OVER (CANVAS)
-- game over screen
------------------------------------------------

-- imports
local Canvas = require('utils.classes.graphics.canvas');
local Vector2 = require('utils.classes.math.vector2');

local Game_Over = Canvas:derive("Game_Over");

-- gameover constructor
function Game_Over:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);
    
    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- gameover draw event
function Game_Over:draw()
    -- render gameover screen
    self.canvas:renderTo(function ()
    end);

    -- draw gameover
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Game_Over