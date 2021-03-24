public class Item implements Cloneable {
  
  
  
  // Vars
  
  int ID;
  
  int XPos;
  int YPos;
  
  float BlockX;
  float BlockY;
  
  int CurrBlock;
  
  
  
  // Constructors
  
  public Item (int ID) {
    this.ID = ID;
    XPos = 0;
    YPos = 0;
    BlockX = 0;
    BlockY = 0;
    CurrBlock = Map.Blocks [XPos] [YPos];
  }
  
  
  
  public Item (int ID, int XPos, int YPos) {
    this.ID = ID;
    this.XPos = XPos;
    this.YPos = YPos;
    BlockX = 0;
    BlockY = 0;
    CurrBlock = Map.Blocks [XPos] [YPos];
  }
  
  
  
  public Item (int ID, int XPos, int YPos, float BlockX, float BlockY) {
    this.ID = ID;
    this.XPos = XPos;
    this.YPos = YPos;
    this.BlockX = BlockX;
    this.BlockY = BlockY;
    CurrBlock = Map.Blocks [XPos] [YPos];
  }
  
  
  
  
  
  public Object clone() {
    try {
      return super.clone();
    } catch (CloneNotSupportedException e) {
      throw (new RuntimeException ("This error should never be seen."));
    }
  }
  
  
  
  
  
}
