public class InputHandler_Class {
  
  
  
  
  
  // Vars
  
  boolean[] Keys = new boolean [128];
  boolean[] PrevKeys = new boolean [128];
  
  boolean PrevMousePressed = false;
  
  
  
  
  
  // Functions
  
  public void Update() {
    if (mousePressed & !PrevMousePressed) Manager.OnMousePressed();
  }
  
  
  
  public void keyPressed() {
    if (key < 128) Keys[key] = true;
    if (key == 27 && !Manager.Crashed) key = 0;
  }
  
  public void keyReleased() {
    if (key < 128) Keys[key] = false;
  }
  
  
  
  public boolean KeyJustPressed (int Key) {
    return Keys[Key] && !PrevKeys[Key];
  }
  
  
  
  public void EndFrame() {
    PrevKeys = (boolean[]) Keys.clone();
    Keys = new boolean [128];
    PrevMousePressed = mousePressed;
  }
  
  
  
  
  
}
