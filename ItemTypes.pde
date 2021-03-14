public class ItemTypes_Class {
  
  
  
  public final int Empty = -1;
  public final int Iron = 0;
  
  
  
  public final String[] ItemNames = {
    "Iron",
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
  
  
  
  public int GetNumberOfItems() {
    return ItemNames.length;
  }
  
  
  
}










public class ItemNameNotRecognizedException extends RuntimeException {
  
  public ItemNameNotRecognizedException (String ErrorMessage) {
    super (ErrorMessage);
  }
  
}
