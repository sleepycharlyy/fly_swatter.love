-- TODO: make class

------------------------------------------------
--             OPTIONS_MENU (CANVAS)
-- options menu screen
------------------------------------------------

-- imports
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');

local Options_Menu = Canvas:derive("Options_Menu");

-- optionsmenu constructor
function Options_Menu:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- optionsmenu draw event
function Options_Menu:draw()
    -- render optionsmenu screen
    self.canvas:renderTo(function ()
    end);

    -- draw optionsmenu
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Options_Menu