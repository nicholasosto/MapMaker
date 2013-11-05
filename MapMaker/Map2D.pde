class Map2D
{

  int cols; 
  int rows;
  Tile[][] tiles; 


  Map2D(int cols, int rows)
  {
    this.cols = cols;
    this.rows = rows;
    this.tiles = new Tile[cols][rows];
    
    initTiles();
    
  }
  
  Map2D(String filename)
  {
    loadMap(filename);
  }


  void display()
  {
    for(int i=0;i<cols;i++)
    {
      for(int j=0;j<rows;j++)
      {
        tiles[i][j].display();
        
      }
    }
  }
  
  void saveMap(String filename)
  {
    String[] map = new String[rows+1];
    
    map[0] = "C:"+cols+"R:"+rows+":X:";
    
    for(int i=0;i<rows;i++)
    {
      map[i+1] = " ";
      for(int j=0;j<cols;j++)
      {
        
        map[i+1] += tiles[j][i].getProp("traversable");
        
        if(j!=cols-1)
        {
          map[i+1] += " , ";
        }

      }
    }
    
    saveStrings(filename, map);
    
  }
  
  
  void loadMap(String filename)
  {
    
    String[] map = loadStrings(filename);
    
    String[] temp_row_data;

    
    int col_index = map[0].indexOf("C:");
    int row_index = map[0].indexOf("R:");
    int end_index = map[0].indexOf(":X:");
    
    this.cols = int(map[0].substring(col_index+2,row_index));
    this.rows = int(map[0].substring(row_index+2,end_index));
    
    tiles = new Tile[this.cols][this.rows];
    
    
      
    
    initTiles();
    
    for(int i = 1; i < map.length; i++)
    {
      temp_row_data = split(map[i],',');
      for(int j=0;j<temp_row_data.length;j++)
      {
        println("i = ",i,"j = ",j);
          tiles[j][i-1].setProp("traversable", float(temp_row_data[j]));
      }
    }

  }
  
  
  
  void initTiles()
  {
    for(int i=0;i<cols;i++)
    {
      for(int j=0;j<rows;j++)
      {
        tiles[i][j] = new Tile(i,j,color(200,0,0),width/cols,height/rows);
        
      }
    } 
  }
  
  
  void resetProps()
  {
    for(int i=0;i<cols;i++)
    {
      for(int j=0;j<rows;j++)
      {
        tiles[i][j].setProp("traversable", 1);
        
      }
    }
  }
  
}


