public class BlockTypes_Class {
  
  
  
  public final int Empty = -1;
  public final int ConveyorUp = 0;
  public final int ConveyorDown = 1;
  public final int ConveyorLeft = 2;
  public final int ConveyorRight = 3;
  
  
  
  public final String[] BlockNames = {
    "ConveyorUp",
    "ConveyorDown",
    "ConveyorLeft",
    "ConveyorRight",
  };
  
  public final int[] ItemIDs = {
    1,
    1,
    1,
    1,
  };
  
  public final int[] BlockRotations = {
    0,
    1,
    2,
    3,
  };
  
  
  
  public String GetBlockName (int BlockID) {
    return BlockNames[BlockID];
  }
  
  public int GetBlockIDFromName (String BlockName) {
    for (int i = 0; i < BlockNames.length; i ++) {
      if (BlockNames[i].equals(BlockName)) return i;
    }
    throw (new BlockNameNotRecognizedException ("Could not find block with name " + BlockName + "."));
  }
  
  
  
  public int GetItemIDOfBlock (int BlockID) {
    return ItemIDs[BlockID];
  }
  
  public int GetBlockRotation (int BlockID) {
    return BlockRotations[BlockID];
  }
  
  
  
  public int GetNumberOfBlocks() {
    return BlockNames.length;
  }
  
  
  
}










public class BlockNameNotRecognizedException extends RuntimeException {
  
  public BlockNameNotRecognizedException (String ErrorMessage) {
    super (ErrorMessage);
  }
  
}
