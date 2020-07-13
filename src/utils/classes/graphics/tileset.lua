------------------------------------------------
--                  TILESET
-- lets you draw single tiles from a tileset
------------------------------------------------

-- imports
local Class = require('utils.classes.class');
local Vector2 = require('utils.classes.math.vector2');

local Tileset = Class:derive("Sprite");

-- sprite constructor
function Tileset:new(sprite_sheet, width, height, tile_width, tile_height)
    self.size = Vector2(width, height);
    self.tile_size = Vector2(tile_width, tile_height);
    self.sprite_sheet = sprite_sheet;
end

-- draw single tile
function Tileset:draw(tile_index, x, y, scale_x, scale_y)
    local i = tile_index or 0;
    local sx = scale_x or 1;
    local sy = scale_y or 1;

    love.graphics.draw(self:tile_by_index(i), x, y, 0, sx, sy);
end

-- get tile by index number
function Tileset:tile_by_index(tile_index)
    -- TODO: get tile by index
end

return Tileset;