------------------------------------------------
--                 FLY (ENTITY)
-- fly object (cursor)
------------------------------------------------

-- imports
local Entity = require('classes.entity');
local Vector2 = require('classes.math.vector2');
local Sprite = require('classes.graphics.sprite');
local Animation = require('classes.graphics.animation');

local Fly = Entity:derive("Fly");

-- fly constructor
function Fly:new()
    self.position = Vector2(WIDTH/2, HEIGHT/2); -- center fly at start of the room
    self.size = Vector2(16, 16);
    self.state = 0; -- 0: deactive, 1: active

    -- sprite
    self.sprite_sheet = love.graphics.newImage("assets/graphics/sprite_sheets/fly.png");
    self.sprite = Sprite(self.sprite_sheet, self.size.x, self.size.y, self.position.x, self.position.y, 1, 1, 0);

    -- animation
    self.animation_fly = Animation(16, 16, 0, 2, 16);
    self.sprite:animation_add("fly", self.animation_fly);
    self.sprite:animate("fly");
end

-- fly update event
function Fly:update(tick)
    if self.state == 1 then
        -- update sprite (animation)
        self.sprite:update(tick);

        -- check if out of bounds when yes deactivate
        if (self.poisiton.x > WIDTH or self.position.x < 0 or self.positon.y > HEIGHT or self.position.y < 0) then
            self:deactivate();
        end
    end
end

-- fly draw event
function Fly:draw()

    if self.state == 1 then
        -- draw sprite
        self.sprite:draw();
    end
end

function Fly:activate()
    -- TODO: spawn on corner of screen

    -- deactivate
    self.active = false;
end

function Fly:deactivate()
    -- move out of bounds when deactivated
    self.position.x = WIDTH*2
    self.position.y = HEIHGT*2

    -- deactivate
    self.active = false;
end

return Fly