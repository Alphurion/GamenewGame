/*
This is file is purely meant to call onto game settings
    #To Do List

- Game

1. Application
* Game Window
* Controller or Keyboard input?

2. Settings
* Pause Menu
* Frame Limiter, vsync
* Difficulty?
* Resolution
*/

//allsettings
const float framerate = 24;

class settings
{ //default settings
    public:
        float resolutionW = 1920;
        float resolutionL = 1080;
        bool fullscreen = true;
        bool vsync = false;

        //volume
        bool enableVolume = true;
        float masterVolume = 100;
        float musicVolume = 100;
        float soundVolume = 100;
        float dialogueVolume = 100;

        //accessibility
        bool photoSensitiveMode = false; 
        bool colorblindMode = false; 
};
