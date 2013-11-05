

Map2D testMap;

void setup()
{
  size(400,400);
  
  testMap = new Map2D(10,10);
  
  
}

void draw()
{
  testMap.display();
  
}





void mouseClicked()
{
  int col = floor(mouseX/testMap.tiles[0][0].tile_width);
  int row = floor(mouseY/testMap.tiles[0][0].tile_height);
  
  if(testMap.tiles[col][row].getProp("traversable") == 1)
  {
    testMap.tiles[col][row].setProp("traversable",0);
  }
  else
  {
    testMap.tiles[col][row].setProp("traversable",1);
  }
  
  
  println("Col: ",col,"Row: ",row);
}

void keyReleased()
{
  
  if (key == 'r') 
  {
    testMap.resetProps();
  }
  if (key == 's')
  {
    testMap.saveMap("Saved_map.tmap");
    println("Map Saved");
  }
  
  if (key == 'l')
  {
    testMap.loadMap("Saved_map.tmap");
    println("Map Loaded");
  }
}
