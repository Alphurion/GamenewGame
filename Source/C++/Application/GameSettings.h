/*
    #ToDo

- Game
1. Make constructor for default settings
2. Determine setters and getters

*/



class Settings
{

};

class Sound : public Settings
{
    //volume
    bool enableVolume = true;
    float masterVolume = 100;
    float musicVolume = 100;
    float soundVolume = 100;
    float dialogueVolume = 100;

};

class Accessibility : public Settings
{
    //accessibility
    bool photoSensitiveMode = false; 
    bool colorblindMode = false;
};
