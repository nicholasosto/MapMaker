class Tile
{
  /* ===  Class Variable(s) ==== */
  color tile_color;
  float tile_height;
  float tile_width;
  float pos_x;
  float pos_y;
  FloatDict props;

/* ===  Constructor(s) ==== */
  Tile(float pos_x, float pos_y, color tile_color, float tile_width, float tile_height) 
  {
    this.tile_width = tile_width;
    this.tile_height = tile_height;
    this.tile_color = tile_color;
    
    this.pos_x = pos_x*tile_width;
    this.pos_y = pos_y*tile_height;
  
    props = new FloatDict();
    
    props.set("traversable",1);
  
  }

/* ===  Function(s) ==== */
  void display() 
  {
    fill(tile_color);
    rect(pos_x,pos_y,tile_width,tile_height);
    
    if(props.get("traversable") == 0)
    {
      fill(10,10,10);
      rect(pos_x+2,pos_y+2,tile_width-4,tile_height-4);
    }
  }
  
  void setProp(String prop, float value)
  {
    props.set(prop,value);
  }
  
  float getProp(String prop)
  {
    return(props.get(prop));
  }

}
