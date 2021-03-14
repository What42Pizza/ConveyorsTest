// Started 03/13/21





// Settings

int MapWidth = 64;
int MapHeight = 32;

int BlockSize = 16; // In pixels





// Global classes

Manager_Class Manager = new Manager_Class();

Map_Class Map;
Renderer_Class Renderer = new Renderer_Class();
Textures_Class Textures = new Textures_Class();
BlockTypes_Class BlockTypes = new BlockTypes_Class();
ItemTypes_Class ItemTypes = new ItemTypes_Class();
ItemsHandler_Class ItemsHandler = new ItemsHandler_Class();
ErrorChecker_Class ErrorChecker = new ErrorChecker_Class();





void setup() {
  
  frameRate (60);
  background (255);
  
  Manager.Init();
  //Manager.InitWOTry();
  
}



void settings() {
  size (MapWidth * BlockSize, MapHeight * BlockSize);
}





void draw() {
  Manager.draw();
}
