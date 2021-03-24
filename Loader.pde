Loader_Class Loader = new Loader_Class();



public class Loader_Class {
  
  
  
  public void LoadBlockTypes() {
    LoadConveyorBlockType();
  }
  
  
  
  public void LoadConveyorBlockType() {
    BlockType_Conveyor = new BlockType();
    PImage[] Textures = new PImage [4];
    Textures[0] = loadImage (dataPath("") + "\\Textures\\Blocks\\ConveyorUp.png");
    Textures[1] = loadImage (dataPath("") + "\\Textures\\Blocks\\ConveyorDown.png");
    Textures[2] = loadImage (dataPath("") + "\\Textures\\Blocks\\ConveyorLeft.png");
    Textures[3] = loadImage (dataPath("") + "\\Textures\\Blocks\\ConveyorRight.png");
    BlockType_Conveyor.Textures = Textures;
  }
  
  
  
  public void LoadItems() {
    ItemTexture = loadImage (dataPath("") + "\\Textures\\Items\\Iron.png");
  }
  
  
  
}
