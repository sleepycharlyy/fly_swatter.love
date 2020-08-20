------------------------------------------------
--             TITLE_SCREEN (CANVAS)
-- title screen
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');
local Level = require('classes.canvasses.rooms.level');

local Title_Screen = Canvas:derive("Title_Screen");

-- titlescreen constructor
function Title_Screen:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- titlescreen draw event
function Title_Screen:draw()
    -- render titlescreen screen
    self.canvas:renderTo(function ()
        font = love.graphics.newFont( 'assets/fonts/Awoof-Mono-Regular.ttf', 20, 'mono');
        love.graphics.setFont(font);
        love.graphics.setColor(0,0,0); -- set to black
        love.graphics.rectangle("fill", 0, 0, WIDTH, HEIGHT); -- black background
        love.graphics.setColor(1,1,1); -- set color to white
        love.graphics.printf("Game Over", 0, HEIGHT/2, 128, 'center'); -- game over text
        if(OS ~= "Android" and OS ~= "iOS") then
            -- if desktop or web then 'click'
            love.graphics.printf("Click to try again", 0, (HEIGHT/2)+32, 256, 'center'); -- try again text
        else
            love.graphics.printf("Touch to try again", 0,  (HEIGHT/2)+32, 256, 'center'); -- try again text
        end
        love.graphics.print("Highscore: "..HIGH_SCORE, 0, 2); -- highscore text
        love.graphics.print("Score: "..CURRENT_SCORE, 0, 32); -- current score text
    end);

    -- draw titlescreen
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end

-- mouse pressed event
function Title_Screen:mousepressed(x, y, button, istouch, presses, screen_class)
    -- mouse was pressed so move to level room again
    screen_class.level = Level(); -- reset level
    CURRENT_SCORE = 0; -- reset current score
    CURRENT_ROOM = 4; -- move to room
end


return Title_Screen
