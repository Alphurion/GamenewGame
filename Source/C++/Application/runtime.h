#include "GameSettings.h"

//DO NOT CHANGE
const float framerate = 24;

class Game
{
private:
        float resolutionW = 1920;
        float resolutionL = 1080;
        bool fullscreen = true;
        bool vsync = false;
public:
    void runGame();

    //Constructor Destructor
    Game();
    ~Game();
};
