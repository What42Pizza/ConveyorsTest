public class ItemsHandler_Class {
  
  
  
  // Vars
  
  ArrayList <Item> AllItems = new ArrayList <Item> ();
  ArrayList <Item> ItemsToUpdate = new ArrayList <Item> ();
  
  
  
  
  
  public boolean InsertItem (Item NewItem) {
    if (!(Map.GetItem (NewItem.XPos, NewItem.YPos) == null)) return false;
    Map.SetItem (NewItem.XPos, NewItem.YPos, NewItem);
    AllItems.add(NewItem);
    return true;
  }
  
  
  
  public Item GrabItem (int XPos, int YPos) {
    Item GrabbedItem = Map.GetItem (XPos, YPos);
    if (GrabbedItem != null) {
      Map.SetItem (XPos, YPos, null);
      RemoveItemFromUpdates (GrabbedItem);
    }
    return GrabbedItem;
  }
  
  
  
  public void RemoveItemFromUpdates (Item ItemToRemove) {
    for (int i = 0; i < ItemsToUpdate.size(); i ++) {
      if (ItemsToUpdate.get(i) == ItemToRemove) {
        ItemsToUpdate.remove(i);
        return;
      }
    }
  }
  
  
  
  public void RemoveItemCompletely (Item ItemToRemove) {
    for (int i = 0; i < AllItems.size(); i ++) {
      if (AllItems.get(i) == ItemToRemove) {
        AllItems.remove(i);
        return;
      }
    }
  }
  
  
  
  
  
  public void UpdateItems() {
    
  }
  
  
  
  
  
}
