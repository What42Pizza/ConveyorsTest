// Started 3/24/21




void setup() {
  size (512, 512);
  Loader.LoadBlockTypes();
  Map.Init();
}





void draw() {
  background (255);
  Renderer.RenderBlocks();
}
