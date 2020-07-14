-- TODO: make class

------------------------------------------------
--             MAIN_MENU (CANVAS)
-- main menu screen
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

local Main_Menu = Canvas:derive("Main_Menu");

-- mainmenu constructor
function Main_Menu:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- mainmenu draw event
function Main_Menu:draw()
    -- render mainmenu screen
    self.canvas:renderTo(function ()
    end);

    -- draw mainmenu
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Main_Menu