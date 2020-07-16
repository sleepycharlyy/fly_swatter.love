------------------------------------------------
--                SCREEN (CANVAS)
-- the main screen where everything seen on the window
-- is drawn onto
------------------------------------------------

-- imports
require('globals');
local Canvas = require('classes.canvas');
local Vector2 = require('classes.math.vector2');
-- rooms
local Level_1 = require('classes.canvasses.rooms.level_1')
-- TODO: do other rooms

local Screen = Canvas:derive("Screen");

-- screen constructor
function Screen:new()
    self.position = Vector2(0, 0)
    self.size = Vector2(WIDTH, HEIGHT);

    self.canvas = love.graphics.newCanvas(self.size.x, self.size.y);

    -- rooms
    self.level_1 = Level_1();
end

-- screen update event
function Screen:update(tick)
    -- update rooms
    if CURRENT_ROOM == 0 then
        -- main_menu
    elseif CURRENT_ROOM == 1 then
        -- options_menu
    elseif CURRENT_ROOM == 2 then
        -- pause_menu
    elseif CURRENT_ROOM == 3 then
        -- share_menu
    elseif CURRENT_ROOM == 4 then
        -- level_1
        self.level_1:update(tick);
    elseif CURRENT_ROOM == 5 then
        -- level_2
    elseif CURRENT_ROOM == 6 then
        -- level_3
    elseif CURRENT_ROOM == 7 then
        -- level_4
    end
end

-- screen draw event
function Screen:draw()
    -- render to screen canvas
        self.canvas:renderTo(function()
           -- draw rooms
            if CURRENT_ROOM == 0 then
                -- main_menu
            elseif CURRENT_ROOM == 1 then
                -- options_menu
            elseif CURRENT_ROOM == 2 then
                -- pause_menu
            elseif CURRENT_ROOM == 3 then
                -- share_menu
            elseif CURRENT_ROOM == 4 then
                -- level_1
                self.level_1:draw();
            elseif CURRENT_ROOM == 5 then
                -- level_2
            elseif CURRENT_ROOM == 6 then
                -- level_3
            elseif CURRENT_ROOM == 7 then
                -- level_4
            end
        end);

    -- draw screen scaled to window size
    love.graphics.draw(self.canvas, self.position.x, self.position.y, 0, love.graphics.getWidth()/WIDTH, love.graphics.getHeight()/HEIGHT);
end

-- mouse pressed event
function Screen:mousepressed(x, y, button, istouch, presses)
    -- pass function to children
    if CURRENT_ROOM == 0 then
        -- main_menu
    elseif CURRENT_ROOM == 1 then
        -- options_menu
    elseif CURRENT_ROOM == 2 then
        -- pause_menu
    elseif CURRENT_ROOM == 3 then
        -- share_menu
    elseif CURRENT_ROOM == 4 then
        -- level_1
        self.level_1:mousepressed(x, y, button, istouch, presses);
    elseif CURRENT_ROOM == 5 then
        -- level_2
    elseif CURRENT_ROOM == 6 then
        -- level_3
    elseif CURRENT_ROOM == 7 then
        -- level_4
    end
end

return Screen