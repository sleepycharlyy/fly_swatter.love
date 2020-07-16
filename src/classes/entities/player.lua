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
    self.position = Vector2(0, 0);
    self.size = Vector2(16, 40);
    self.origin = Vector2(8, 0);

    self.sprite_sheet = love.graphics.newImage("assets/graphics/sprite_sheets/cursor.png");
    self.sprite = Sprite(self.sprite_sheet, self.size.x, self.size.y, self.position.x, self.position.y, 1, 1, 0, self.origin.x, self.origin.y);
end

-- player update event
function Player:update(tick)
    -- set player position to mouse position
    self.position.x = love.mouse.getX();
    self.position.y = love.mouse.getY();
end

-- player draw event
function Player:draw()
    -- set sprite position to position of player
    self.sprite.position.x = self.position.x;
    self.sprite.position.y = self.position.y;
    
    -- draw sprite
    self.sprite:draw();

    -- todo: make drawing functional idk
end

return Player;