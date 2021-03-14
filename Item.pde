public class Item {
  
  
  
  // Vars
  
  int Type;
  
  int XPos;
  int YPos;
  
  float BlockX;
  float BlockY;
  
  int CurrBlock;
  
  
  
  // Constructors
  
  public Item (int Type, int XPos, int YPos) {
    this.Type = Type;
    this.XPos = XPos;
    this.YPos = YPos;
    BlockX = 0;
    BlockY = 0;
    CurrBlock = Map.Blocks [XPos] [YPos];
  }
  
  
  
  public Item (int Type, int XPos, int YPos, float BlockX, float BlockY) {
    this.Type = Type;
    this.XPos = XPos;
    this.YPos = YPos;
    this.BlockX = BlockX;
    this.BlockY = BlockY;
    CurrBlock = Map.Blocks [XPos] [YPos];
  }
  
  
  
}
