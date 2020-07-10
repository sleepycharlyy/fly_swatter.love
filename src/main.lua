require("math");

-- constants
GAME_TITLE = "Fly Swatter";
GAME_VERSION = 0.1;
WIDTH = 256;
HEIGHT = 224;

-- executes when game starts
function love.load()
    -- set title
    love.window.setTitle(GAME_TITLE.." "..GAME_VERSION);
    -- set window mode
    love.window.setMode(1280, 800);
    -- create main canvas
    canvas = love.graphics.newCanvas(WIDTH, HEIGHT);
end

-- called on every tick for calculations
function love.update(tick)

end

-- called on every tick for graphics
function love.draw()
    -- render to canvas
    canvas:renderTo(function()
        love.graphics.setColor(1,1,1);
        love.graphics.rectangle("fill", 0, 0, WIDTH, HEIGHT);
    end)
    
    -- render canvas to screen and scale it to screen size
    love.graphics.draw(canvas, 0, 0, 0, love.graphics.getWidth()/WIDTH, love.graphics.getHeight()/HEIGHT);
end


