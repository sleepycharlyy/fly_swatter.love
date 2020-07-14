------------------------------------------------
--                  VECTOR2
-- a two dimensional vector
------------------------------------------------

-- imports
local Class = require('class');

local Vector2 = Class:derive("Vector2");

-- vector2 constructor
function Vector2:new(x, y)
    self.x = x or 0;
    self.y = y or 0;
end

-- calculate the distance from a vector2 to another vector2 (destination)
function Vector2:get_distance_to(destination) 
    return math.sqrt(math.abs((destination.y - self.y)^2 + (destination.x - self.y)^2));
end

-- TODO: other vector functions

return Vector2;