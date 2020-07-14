------------------------------------------------
--             BACKGROUND (CANVAS)
-- this is where the background gets rendered onto
------------------------------------------------

-- imports
require('globals');
local Canvas = require('classes.canvas');
local Tileset = require('classes.graphics.tileset');
local Tile = require('classes.graphics.tile');
local Vector2 = require('classes.math.vector2');

local Background = Canvas:derive("Background");

-- background constructor
function Background:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    -- create tileset
    self.tileset_image = love.graphics.newImage("assets/graphics/tilesets/background_tiles.png");
    self.tileset = Tileset(self.tileset_image, 16, 16, 16, 16);

    -- create level 1 tile
    self.tile_1 = Tile(self.tileset, 0);
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
                    --[[ love.graphics.setColor(1,1,1);
                    love.graphics.rectangle("fill", _x*16, _y*16, 16, 16); ]]--
                    self.tile_1:draw(_x*16, _y*16)
                end
            end
        end
    end);

    -- draw background
    love.graphics.draw(self.canvas, self.position.x, self.position.y);
end


return Background