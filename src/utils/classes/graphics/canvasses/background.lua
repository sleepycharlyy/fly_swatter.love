------------------------------------------------
--             BACKGROUND (CANVAS)
-- this is where the background gets rendered onto
------------------------------------------------

-- imports
local Canvas = require('utils.classes.graphics.canvas');
local Tileset = require('utils.classes.graphics.tileset');
local Vector2 = require('utils.classes.math.vector2');

local Background = Canvas:derive("Background");

-- background constructor
function Background:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    -- create tilesheet
    background_tileset_image = love.graphics.newImage("assets/graphics/spritesheets/tiles.png");
    background_tileset = Tileset(background_tileset_image, 16, 16, 16, 16);
end

-- background draw event
function Background:draw()
    -- render background
    self.canvas:renderTo(function ()
        -- draw background color
        love.graphics.setBackgroundColor(18/255, 9/255, 25/255);

        tile_width = WIDTH/16 - 1;
        tile_height = HEIGHT/16 - 1;

        -- draw tiles
        for _x = 0, tile_width, 1 do
            for _y = 0, tile_height, 1 do
                -- leave a border around screen without tiles
                if not((_x == 0) or (_y == 0) or (_x == tile_width) or (_y == tile_height)) then
                    love.graphics.setColor(1,1,1);
                    love.graphics.rectangle("fill", _x*16, _y*16, 16, 16);
                    -- background_tileset:draw(0, _x*16, _y*16);
                end
            end
        end
    end);

    -- draw background
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Background