------------------------------------------------
--                   ENTITY
-- used as parent for other entity objects
-- TODO: Make class lol
------------------------------------------------

-- imports
local Class = require('class');
local Vector2 = require('classes.math.vector2');

local Entity = Class:derive("Entity");

-- canvas constructor
function Entity:new()
end

return Entity;