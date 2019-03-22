defmodule Identicon.Image do
     @moduledoc """
          To use this struct need do the following:
          %Identicon.Image{hex : nil}
          It's similar a map, but not in everything. Because in a map we can add a new property
          Using Map.put(latestMap, newProperty, "the value for this property");
          and in a struct we can't do it, we will get just property defined in the struct!!!
          I've seen this as interface ------- !!! ---- !!!
     """
    defstruct  input_in_binary: nil,
               color_rgb: nil,
               grid: nil,  
               pixel_map: nil
          ;

end