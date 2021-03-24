public class Manager_Class {
  
  
  
  // Vars
  
  boolean Crashed = false;
  String CrashMessage = null;
  
  
  
  
  
  // Functions
  
  public void Init() {
    try {
      InitWOTry();
    } catch (Exception e) {
      Crash (e);
    }
  }
  
  
  
  public void InitWOTry() {
    Map = new Map_Class (MapWidth, MapHeight);
    Textures.LoadBlockTextures();
    Textures.LoadItemTextures();
  }
  
  
  
  
  
  void draw() {
    if (Crashed) {
      DrawCrashed();
    } else {
      DrawNormal();
    }
  }
  
  
  
  void DrawCrashed() {
    background (255);
    fill (0);
    textSize (width / 25);
    float TextSize = g.textSize;
    text ("An error has occuered:", TextSize * 0.25, TextSize);
    textSize (min (TextSize * width * 0.975 / textWidth (CrashMessage), TextSize * 0.9));
    text (CrashMessage, TextSize * 0.25, TextSize * 2);
  }
  
  
  
  void DrawNormal() {
    
    // Update
    InputHandler.Update();
    Cursor.Update();
    
    // Render
    background (255);
    Renderer.RenderBlocks();
    Renderer.RenderItems();
    
    // Finish
    InputHandler.EndFrame();
    
  }
  
  
  
  
  
  void keyPressed() {
    InputHandler.keyPressed();
  }
  
  void keyReleased() {
    InputHandler.keyReleased();
  }
  
  
  
  
  
  void OnMousePressed() {
    Cursor.HandleClick();
  }
  
  
  
  void PlaceBlock (int BlockID, int XPos, int YPos) {
    Map.SetBlock (XPos, YPos, BlockID);
  }
  
  
  
  void PlaceItem (Item ItemIn, int XPos, int YPos) {
    
  }
  
  
  
  
  
  public void Crash (Exception e) {
    Crashed = true;
    CrashMessage = e.toString();
    e.printStackTrace();
  }
  
  
  
}










public class LoadFailedException extends RuntimeException {
  
  public LoadFailedException (String ErrorMessage) {
    super (ErrorMessage);
  }
  
}
