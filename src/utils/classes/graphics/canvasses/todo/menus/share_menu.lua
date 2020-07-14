-- TODO: make class

------------------------------------------------
--             SHARE_MENU (CANVAS)
-- share menu screen
------------------------------------------------

-- imports
local Canvas = require('utils.classes.graphics.canvas');
local Vector2 = require('utils.classes.math.vector2');

local Share_Menu = Canvas:derive("Share_Menu");

-- sharemenu constructor
function Share_Menu:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);
  
    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);
end

-- sharemenu draw event
function Share_Menu:draw()
    -- render sharemenu screen
    self.canvas:renderTo(function ()
    end);

    -- draw sharemenu
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Share_Menu