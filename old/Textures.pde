public class Textures_Class {
  
  
  
  PImage[] BlockTextures;
  PImage[] ItemTextures;
  
  
  
  public void LoadBlockTextures() {
    
    File TexturesFolder = new File (dataPath("") + "\\Textures\\Blocks");
    ErrorChecker.EnsureFileExists (TexturesFolder);
    ErrorChecker.EnsureFileIsFolder (TexturesFolder);
    
    String[] AllTextureFileNames = TexturesFolder.list();
    AllTextureFileNames = RemoveNonPNGNames (AllTextureFileNames);
    int NumOfBlocks = BlockTypes.GetNumberOfBlocks();
    int NumOfFiles = AllTextureFileNames.length;
    ErrorChecker.EnsureEqual (NumOfFiles, NumOfBlocks, "Expected " + NumOfBlocks + " files in '" + dataPath("") + "\\Textures\\Blocks', but got " + NumOfFiles + ".");
    
    BlockTextures = new PImage [NumOfBlocks];
    for (String TextureFileName : AllTextureFileNames) {
      LoadBlockTexture (TextureFileName);
    }
    
  }
  
  
  
  public void LoadBlockTexture (String TextureFileName) {
    String TextureName = RemoveFileExtension (TextureFileName);
    int BlockID = BlockTypes.GetBlockIDFromName (TextureName);
    PImage LoadedImage = loadImage (dataPath("") + "\\Textures\\Blocks\\" + TextureFileName);
    BlockTextures [BlockID] = LoadedImage;
  }
  
  
  
  
  
  public void LoadItemTextures() {
    
    File TexturesFolder = new File (dataPath("") + "\\Textures\\Items");
    ErrorChecker.EnsureFileExists (TexturesFolder);
    ErrorChecker.EnsureFileIsFolder (TexturesFolder);
    
    String[] AllTextureFileNames = TexturesFolder.list();
    AllTextureFileNames = RemoveNonPNGNames (AllTextureFileNames);
    int NumOfItems = ItemTypes.GetNumberOfItems();
    int NumOfFiles = AllTextureFileNames.length;
    ErrorChecker.EnsureEqual (NumOfFiles, NumOfItems, "Expected " + NumOfItems + " files in '" + dataPath("") + "\\Textures\\Items', but got " + NumOfFiles + ".");
    
    ItemTextures = new PImage [NumOfItems];
    for (String TextureFileName : AllTextureFileNames) {
      LoadItemTexture (TextureFileName);
    }
    
  }
  
  
  
  public void LoadItemTexture (String TextureFileName) {
    String TextureName = RemoveFileExtension (TextureFileName);
    int ItemID = ItemTypes.GetItemIDFromName (TextureName);
    PImage LoadedImage = loadImage (dataPath("") + "\\Textures\\Items\\" + TextureFileName);
    ItemTextures [ItemID] = LoadedImage;
  }
  
  
  
  
  
  public String[] RemoveNonPNGNames (String[] FileNames) {
    StringList NewNamesList = new StringList();
    for (String S : FileNames) {
      if (FileIsPNG(S)) {
        NewNamesList.append(S);
      }
    }
    return Converter.Convert (NewNamesList);
  }
  
  
  
  public boolean FileIsPNG (String FileName) {
    return GetFileExtension(FileName).equals("png");
  }
  
  
  
  public String RemoveFileExtension (String FileName) {
    return FileName.split("[.]")[0];
  }
  
  public String GetFileExtension (String FileName) {
    String[] FileNameSplit = FileName.split("[.]");
    if (FileNameSplit.length < 2) return "";
    return FileNameSplit[1];
  }
  
  
  
}
