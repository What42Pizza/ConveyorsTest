public class Cursor_Class {
  
  
  
  Item ItemBeingHeld = null;
  
  int Rotation = 0;
  
  
  
  public void Update() {
    if (InputHandler.KeyJustPressed('r')) Rotation = (Rotation + 1) % 4;
    if (InputHandler.KeyJustPressed('q')) PickBlock();
  }
  
  
  
  public void PickBlock() {
    int[] Pos = GetCursorWorldPos();
    int BlockBeingHovered = Map.GetBlock (Pos[0], Pos[1]);
    int BlockBeingHoveredID = BlockTypes.GetItemIDOfBlock (BlockBeingHovered);
    if (BlockBeingHoveredID == -1) {
      ItemBeingHeld = null;
    } else {
      ItemBeingHeld = new Item (BlockBeingHoveredID);
    }
  }
  
  
  
  public void HandleClick() {
    if (ItemBeingHeld != null) PlaceItemBeingHeld();
  }
  
  
  
  public void PlaceItemBeingHeld() {
    int[] Pos = GetCursorWorldPos();
    if (ItemTypes.ItemIsBlock (ItemBeingHeld)) {
      Manager.PlaceBlock (ItemTypes.GetBlockIDOfItem (ItemBeingHeld, Rotation), Pos[0], Pos[1]);
    } else {
      Manager.PlaceItem ((Item)ItemBeingHeld.clone(), Pos[0], Pos[1]);
    }
  }
  
  
  
  public int[] GetCursorWorldPos() {
    return new int[] {mouseX / BlockSize, mouseY / BlockSize};
  }
  
  
  
}
