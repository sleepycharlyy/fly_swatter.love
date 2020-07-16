------------------------------------------------
--                   MAIN
--
------------------------------------------------

-- imports
require('globals');
local Screen = require('classes.canvasses.screen');

local Sprite = require('classes.graphics.sprite');

-- executes when game starts
function love.load()
    -- set title
    love.window.setTitle(GAME_TITLE.." "..GAME_VERSION);

    -- set window mode
    love.window.setMode(640, 400, {
        fullscreen = false,
        resizable = true,
        minwidth = WIDTH,
        minheight = HEIGHT,
    });

    -- hide default cursor 
    love.mouse.setVisible(false);

    -- set default scaling filter
    love.graphics.setDefaultFilter('nearest', 'nearest');

    -- create screen
    screen = Screen();



    sprite_sheet = love.graphics.newImage("assets/graphics/sprite_sheets/cursor.png");
    sprite = Sprite(sprite_sheet, 16, 40, 32, 16, 1, 1, 0);
end

-- called on every tick for calculations
function love.update(tick)
    -- accomidate for lag
    if (tick > 0.035) then return; end

    -- update
    screen:update(tick);
end

-- called on every tick for graphics
function love.draw()
    -- render screen
    screen:draw();

    sprite:draw();
end

-- keyboard event
function love.keypressed(key)
    -- fullscreen changing
    if key == "f11" then
        love.window.setFullscreen(not love.window.getFullscreen());
    end
    -- close game
    if key == "escape" then
        love.event.quit();
    end
end
