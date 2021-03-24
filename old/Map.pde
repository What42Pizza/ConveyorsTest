public class Map_Class {
  
  
  
  
  
  // Vars
  
  int[][] Blocks;
  Item[][] Items;
  
  int Width;
  int Height;
  
  
  
  
  
  // Constructors
  
  public Map_Class() {
    Width = 10;
    Height = 10;
    Blocks = new int [Width] [Height];
    Items = new Item [Width] [Height];
    FillBlocks (-1);
    FillItems (null);
  }
  
  public Map_Class (int Width, int Height) {
    this.Width = Width;
    this.Height = Height;
    Blocks = new int [Width] [Height];
    Items = new Item [Width] [Height];
    FillBlocks (-1);
    FillItems (null);
  }
  
  
  
  
  
  // Functions
  
  public int GetBlock (int XPos, int YPos) {
    return Blocks [XPos] [YPos];
  }
  
  public void SetBlock (int XPos, int YPos, int NewBlock) {
    Blocks [XPos] [YPos] = NewBlock;
  }
  
  public void FillBlocks (int FillBlock) {
    for (int YPos = 0; YPos < Height; YPos ++) {
      for (int XPos = 0; XPos < Width ; XPos ++) {
        Blocks[XPos][YPos] = FillBlock;
      }
    }
  }
  
  
  
  
  
  public Item GetItem (int XPos, int YPos) {
    return Items [XPos] [YPos];
  }
  
  public void SetItem (int XPos, int YPos, Item NewItem) {
    Items [XPos] [YPos] = NewItem;
  }
  
  public void FillItems (Item FillItem) {
    for (int YPos = 0; YPos < Height; YPos ++) {
      for (int XPos = 0; XPos < Width ; XPos ++) {
        Items[XPos][YPos] = FillItem;
      }
    }
  }
  
  
  
  
  
}
