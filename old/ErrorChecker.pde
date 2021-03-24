public class ErrorChecker_Class {
  
  
  
  public void EnsureFileExists (File FileIn) {
    if (!FileIn.exists()) throw (new LoadFailedException ("The file " + dataPath("") + " does not exist."));
  }
  
  public void EnsureFileIsFolder (File FileIn) {
    if (!FileIn.isDirectory()) throw (new LoadFailedException (dataPath("") + " has to be a folder."));
  }
  
  
  
  public void EnsureEqual (int In1, int In2, String ErrorMessage) {
    if (In1 != In2) throw (new LoadFailedException (ErrorMessage));
  }
  
  
  
  public void Throw (String ErrorMessage) {
    throw (new LoadFailedException (ErrorMessage));
  }
  
  
  
}
