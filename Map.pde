Map_Class Map = new Map_Class();



public class Map_Class {
  
  
  
  Block[][] Blocks;
  Item[][] Items;
  
  
  
  public void Init() {
    Blocks = new Block [width / 16] [height / 16];
    Items = new Item [width / 16] [height / 16];
  }
  
  
  
}
