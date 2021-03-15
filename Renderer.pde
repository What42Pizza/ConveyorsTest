public class Renderer_Class {
  
  
  
  
  
  public void RenderBlocks() {
    for (int YPos = 0; YPos < Map.Height; YPos ++) {
      for (int XPos = 0; XPos < Map.Width ; XPos ++) {
        int CurrBlock = Map.GetBlock (XPos, YPos);
        if (CurrBlock != -1) RenderBlock (CurrBlock, XPos, YPos);
      }
    }
  }
  
  public void RenderBlock (int BlockID, int XPos, int YPos) {
    PImage BlockTexture = Textures.BlockTextures[BlockID];
    image (BlockTexture, XPos * BlockSize, YPos * BlockSize);
  }
  
  
  
  
  
  public void RenderItems() {
    for (Item I : ItemsHandler.AllItems) {
      RenderItem (I);
    }
  }
  
  public void RenderItem (Item ItemToRender) {
    PImage ItemTexture = Textures.ItemTextures[ItemToRender.ID];
    image (ItemTexture, (ItemToRender.XPos + ItemToRender.BlockX) * BlockSize, (ItemToRender.YPos + ItemToRender.BlockY) * BlockSize);
  }
  
  
  
  
  
}
