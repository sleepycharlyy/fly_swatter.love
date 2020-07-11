require("math");

-- constants
GAME_TITLE = "Fly Swatter";
GAME_VERSION = 0.1;
WIDTH = 256;
HEIGHT = 224;

local spritesheet_tiles;
local sprite_tile_1;

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

    -- create main canvas
    canvas = love.graphics.newCanvas(WIDTH, HEIGHT);

    -- create background canvas
    background = love.graphics.newCanvas(WIDTH, HEIGHT);

    -- create tiles spritebatch
    spritesheet_tiles = love.graphics.newImage("assets/gfx/spritesheets/tiles.png");
    sprite_tile_1 = love.graphics.newQuad(0, 0, 16, 16, spritesheet_tiles:getDimensions());

end

-- called on every tick for calculations
function love.update(tick)

end

-- called on every tick for graphics
function love.draw()
    -- render background
    background:renderTo(function ()
        -- draw background color
        love.graphics.setColor(18/255, 9/255, 25/255);
        love.graphics.rectangle("fill", 0, 0, WIDTH, HEIGHT);

        -- draw tiles
        for _x = 0, 15, 1 do
            for _y = 0, 13, 1 do
                if not((_x == 0) or (_y == 0) or (_x == 15) or (_y == 13)) then
                    love.graphics.draw(spritesheet_tiles, _x*16, _y*16);
                end
            end
        end
    end);

    -- render to main canvas
    canvas:renderTo(function()
        -- draw background
        love.graphics.draw(background, 0, 0);
    end);

    -- render canvas to screen and scale it to screen size
    love.graphics.draw(canvas, 0, 0, 0, love.graphics.getWidth()/WIDTH, love.graphics.getHeight()/HEIGHT);
end


