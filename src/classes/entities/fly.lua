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
    self.position = Vector2(WIDTH/2, math.random(32, HEIGHT-32)); -- spawn fly at bottom of screen on random x axis
    self.size = Vector2(16, 16);
    self.state = 1; -- 0: deactive, 1: active
    self.speed = 80; -- entity speed
    self.angle = 0 -- angle in which direction the fly flies to

    -- timer
    self.timer = 0; -- timer
    self.timer_length = 1; -- how many seconds long the timer goes on till it resets

    -- sprite
    self.sprite_sheet = love.graphics.newImage("assets/graphics/sprite_sheets/fly.png");
    self.sprite = Sprite(self.sprite_sheet, self.size.x, self.size.y, self.position.x, self.position.y, 1, 1, 0);

    -- animation
    self.animation_fly = Animation(16, 16, 0, 2, 16);
    self.sprite:animation_add("fly", self.animation_fly);
    self.sprite:animate("fly");
end

-- fly update event
function Fly:update(delta_time)
    if self.state == 1 then
        -- update sprite (animation)
        self.sprite:update(delta_time);
        self.sprite.position = self.position;

        -- movement
        self:move(delta_time);

        -- check if out of bounds when yes deactivate
        if (self.position.x > WIDTH or self.position.x < 0 or self.position.y > HEIGHT or self.position.y < 0) then
                self:deactivate();
                -- player dies => move to gameover screen
                CURRENT_ROOM = 5 -- move to game_over room
                if (CURRENT_SCORE > HIGH_SCORE) then HIGH_SCORE = CURRENT_SCORE; end -- check if new highscore
                CURRENT_SCORE = 0; -- reset current score
        end

        -- update timer
        self.timer = self.timer + delta_time;
        if(self.timer > self.timer_length) then self.timer = 0; end
    end
end

-- fly draw event
function Fly:draw()

    if self.state == 1 then
        -- draw sprite
        self.sprite:draw();
    end
end

-- activate (change state to 1) fly
function Fly:activate()
    -- TODO: spawn on corner of screen

    -- activate
    self.state = 1;
end

-- deactivate (change state to 0) fly
function Fly:deactivate()
    -- move out of bounds when deactivated
    self.position.x = WIDTH*2;
    self.position.y = HEIGHT*2;

    -- deactivate
    self.state = 0;
end

-- move fly into a random direction
function Fly:move(delta_time)
    -- set random angle (every time the timer hits 0)
    if (self.timer == 0) then self.angle = math.random(-360,360); end
    -- move fly 
    self.position.x = (self.position.x + math.cos(self.angle) * self.speed * delta_time);
    self.position.y = (self.position.y + math.sin(self.angle) * self.speed * delta_time);
end

return Fly