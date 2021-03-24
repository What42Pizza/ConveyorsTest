public static class Converter {
  
  
  
  public static String[] Convert (StringList In) {
    String[] Out = new String [In.size()];
    for (int i = 0; i < Out.length; i ++) {
      Out[i] = In.get(i);
    }
    return Out;
  }
  
  
  
}
