------------------------------------------------
--                  GLOBALS
--  (& constants)
------------------------------------------------

-- constants
GAME_TITLE = "Fly Swatter";
GAME_VERSION = "a.0.1.5";
WIDTH = 256;
HEIGHT = 224;
OS = "Linux"; -- The current operating system. "OS X", "Windows", "Linux", "Android" or "iOS"
DEBUG = true; -- debug mode

-- globals
HIGH_SCORE = 0;
CURRENT_SCORE = 0;
CURRENT_ROOM = 4; -- it starts at 4 cause other rooms were planned so well idk maybe ill add them later
    -- 4 = level
    -- 5 = gameover
PAUSED = false; -- if game is paused