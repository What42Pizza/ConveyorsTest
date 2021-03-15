public class ItemTypes_Class {
  
  
  
  public final int Empty = -1;
  public final int Iron = 0;
  public final int Conveyor = 1;
  
  
  
  public final String[] ItemNames = {
    "Iron",
    "Conveyor",
  };
  
  public final boolean[] ItemBlocks = {
    false,
    true,
  };
  
  
  
  public String GetItemName (int ItemID) {
    return ItemNames[ItemID];
  }
  
  public int GetItemIDFromName (String ItemName) {
    for (int i = 0; i < ItemNames.length; i ++) {
      if (ItemNames[i].equals(ItemName)) return i;
    }
    throw (new BlockNameNotRecognizedException ("Could not find item with name " + ItemName + "."));
  }
  
  
  
  public boolean ItemIsBlock (int ItemID) {
    return ItemBlocks[ItemID];
  }
  
  public boolean ItemIsBlock (Item ItemIn) {
    return ItemIsBlock (ItemIn.ID);
  }
  
  
  
  public int GetBlockIDOfItem (Item ItemIn, int Rotation) {
    if (!ItemIsBlock(ItemIn)) return -1;
    switch (ItemIn.ID) { // This is probably a terrible way to do it but I'm not going to have any other blocks so this is technically overkill
      case (1):
        return Rotation;
      default:
        return -1;
    }
  }
  
  
  
  public int GetNumberOfItems() {
    return ItemNames.length;
  }
  
  
  
}










public class ItemNameNotRecognizedException extends RuntimeException {
  
  public ItemNameNotRecognizedException (String ErrorMessage) {
    super (ErrorMessage);
  }
  
}
