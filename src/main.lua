require("math");

-- constants
GAME_TITLE = "Fly Swatter";
GAME_VERSION = 0.1

-- executes when game starts
function love.load()
    love.window.setTitle(GAME_TITLE.." "..GAME_VERSION);
end

-- called on every tick for calculations
function love.update(tick)

end

-- called on every tick for graphics
function love.draw()
    love.graphics.rectangle("fill", 200, 400, 200, 100);
end


