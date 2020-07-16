------------------------------------------------
--                   PLAYER (ENTITY)
-- player object (cursor)
------------------------------------------------

-- imports
local Entity = require('classes.entity');
local Vector2 = require('classes.math.vector2');
local Sprite = require('classes.graphics.sprite');

local Player = Entity:derive("Player");

-- player constructor
function Player:new()
    self.position = Vector2(WIDTH/2, HEIGHT/2); -- center player at start of the room
    self.size = Vector2(16, 40);

    self.sprite_sheet = love.graphics.newImage("assets/graphics/sprite_sheets/player.png");
    self.sprite = Sprite(self.sprite_sheet, self.size.x, self.size.y, self.position.x, self.position.y, 1, 1, 0);
end

-- player update event
function Player:update(tick)
    -- check if on mobile or nahh
    if(OS ~= "Android" or OS ~= "iOS") then
        -- set player position to mouse position (additional calculations to make the mouse position relative to the screen size)
        self.position.x = (love.mouse.getX()* WIDTH) / love.graphics.getWidth();
        self.position.y = (love.mouse.getY() * HEIGHT) / love.graphics.getHeight();
    end
end

-- player draw event
function Player:draw()
    -- set sprite position to position of player
    self.sprite.position.x = self.position.x;
    self.sprite.position.y = self.position.y;
    
    -- draw sprite
    self.sprite:draw();
end

-- mouse pressed event
function Player:mousepressed(x, y, button, istouch, presses)
    --[[
        NOTE: i got an idea to use the 'presses' variable for maybe sum kinda special attack when screen is double clicked / tapped
    ]]--


    -- handle mouse press
    -- TODO

    -- if touch move player to current press position
    if istouch then
        -- set player position to press position (additional calculations to make the mouse position relative to the screen size)
        self.position.x = (x * WIDTH) / love.graphics.getWidth();
        self.position.y = (y * HEIGHT) / love.graphics.getHeight();
    end
end

return Player;