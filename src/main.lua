------------------------------------------------
--                   MAIN
--
------------------------------------------------

-- imports
require('globals');
local Screen = require('classes.canvasses.screen');

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

    -- set default scaling filter
    love.graphics.setDefaultFilter('nearest', 'nearest');

    -- create screen
    screen = Screen();
end

-- called on every tick for calculations
function love.update(tick)
    -- accomidate for lag
    if (tick > 0.035) then return; end
    
end

-- called on every tick for graphics
function love.draw()
    -- render screen
    screen:draw();
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
