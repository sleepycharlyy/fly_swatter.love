-- TODO: make class

------------------------------------------------
--             GAME_OVER (CANVAS)
-- game over screen
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

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
        love.graphics.setColor(0,0,0); -- set to black
        love.graphics.rectangle("fill", 0, 0, WIDTH, HEIGHT); -- black background
        love.graphics.setColor(1,1,1); -- set color to white
        love.graphics.print("Game Over", WIDTH/2, HEIGHT/2); -- game over text
        love.graphics.print("Highscore: "..HIGH_SCORE, 0, 0); -- highscore text
        love.graphics.print("Score: "..CURRENT_SCORE, 0, 0); -- current score text

    end);

    -- draw gameover
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Game_Over