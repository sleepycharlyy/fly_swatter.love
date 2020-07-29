------------------------------------------------
--                  GLOBALS
--
------------------------------------------------

-- constants
GAME_TITLE = "Fly Swatter";
GAME_VERSION = "a.0.1.3";
WIDTH = 256;
HEIGHT = 224;
OS = "Linux"; -- The current operating system. "OS X", "Windows", "Linux", "Android" or "iOS"

-- globals
HIGH_SCORE = 0;
CURRENT_SCORE = 0;
CURRENT_ROOM = 4; 
    -- 0 = main_menu
    -- 1 = options_menu
    -- 2 = pause_menu
    -- 3 = share_menu
    -- 4 = level
    -- 5 = gameover