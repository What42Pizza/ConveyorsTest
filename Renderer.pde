Renderer_Class Renderer = new Renderer_Class();



public class Renderer_Class {
  
  
  
  public void RenderBlocks() {
    Block[][] BlocksToRender = Map.Blocks;
    int Width = BlocksToRender.length;
    int Height = BlocksToRender[0].length;
    for (int YPos = 0; YPos < Height; YPos ++) {
      for (int XPos = 0; XPos < Width; XPos ++) {
        Block CurrBlock = BlocksToRender[XPos][YPos];
        if (CurrBlock != null) {
          RenderBlock (CurrBlock, XPos, YPos);
        }
      }
    }
  }
  
  
  
  public void RenderBlock (Block CurrBlock, int XPos, int YPos) {
    PImage CurrTexture = CurrBlock.Type.Textures[CurrBlock.Rotation];
    image (CurrTexture, XPos * 16, YPos * 16);
  }
  
  
  
  
  
  public void RenderItems() {
    Item[][] ItemsToRender = Map.Items;
    int Width = ItemsToRender.length;
    int Height = ItemsToRender[0].length;
    for (int YPos = 0; YPos < Height; YPos ++) {
      for (int XPos = 0; XPos < Width; XPos ++) {
        Item CurrItem = ItemsToRender[XPos][YPos];
        if (CurrItem != null) {
          RenderItem (CurrItem, XPos, YPos);
        }
      }
    }
  }
  
  
  
  public void RenderItem (Item CurrItem, int XPos, int YPos) {
    PImage CurrTexture = ItemTexture;
    image (CurrTexture, XPos * 16, YPos * 16);
  }
  
  
  
}
